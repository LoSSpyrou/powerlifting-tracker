import 'package:drift/drift.dart';

import '../../shared/models/lift_type.dart';
import '../database.dart';
import 'logged_set.dart';

class LogRepository {
  LogRepository(this._db);

  final AppDatabase _db;

  Stream<List<Lift>> watchLifts() => _db.select(_db.lifts).watch();

  Stream<List<LoggedSet>> watchTodaysSets() {
    final query =
        _db.select(_db.setEntries).join([
            innerJoin(_db.lifts, _db.lifts.id.equalsExp(_db.setEntries.liftId)),
            innerJoin(
              _db.sessions,
              _db.sessions.id.equalsExp(_db.setEntries.sessionId),
            ),
          ])
          ..where(_db.sessions.date.isBetweenValues(_startOfToday, _endOfToday))
          ..orderBy([OrderingTerm.desc(_db.setEntries.createdAt)]);

    return query.watch().map(
      (rows) => rows
          .map(
            (row) => LoggedSet(
              entry: row.readTable(_db.setEntries),
              lift: row.readTable(_db.lifts),
            ),
          )
          .toList(),
    );
  }

  Future<void> logSet({
    required int liftId,
    required double weight,
    required int reps,
    double? rpe,
    required WeightUnit unit,
  }) async {
    final session = await _todaysSession();
    await _db
        .into(_db.setEntries)
        .insert(
          SetEntriesCompanion.insert(
            sessionId: session.id,
            liftId: liftId,
            weight: weight,
            reps: reps,
            rpe: Value(rpe),
            unit: unit,
          ),
        );
  }

  Future<SetEntry?> lastSetForLift(int liftId) {
    return (_db.select(_db.setEntries)
          ..where((s) => s.liftId.equals(liftId))
          ..orderBy([(s) => OrderingTerm.desc(s.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<Session> _todaysSession() async {
    final existing =
        await (_db.select(
              _db.sessions,
            )..where((s) => s.date.isBetweenValues(_startOfToday, _endOfToday)))
            .getSingleOrNull();
    if (existing != null) return existing;

    final id = await _db
        .into(_db.sessions)
        .insert(SessionsCompanion.insert(date: _startOfToday));
    return Session(id: id, date: _startOfToday);
  }

  DateTime get _startOfToday {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  DateTime get _endOfToday => _startOfToday.add(const Duration(days: 1));
}
