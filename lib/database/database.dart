import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../shared/models/lift_type.dart';
import 'tables/lifts_table.dart';
import 'tables/sessions_table.dart';
import 'tables/set_entries_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Lifts, Sessions, SetEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedDefaultLifts();
        },
      );

  Future<void> _seedDefaultLifts() async {
    await batch((b) {
      b.insertAll(lifts, [
        LiftsCompanion.insert(type: LiftType.squat),
        LiftsCompanion.insert(type: LiftType.bench),
        LiftsCompanion.insert(type: LiftType.deadlift),
      ]);
    });
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'powerlifting_tracker');
}
