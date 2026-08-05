import 'package:drift/drift.dart';
import '../../shared/models/lift_type.dart';
import 'lifts_table.dart';
import 'sessions_table.dart';

@DataClassName('SetEntry')
class SetEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId => integer().references(Sessions, #id)();
  IntColumn get liftId => integer().references(Lifts, #id)();
  RealColumn get weight => real()();
  IntColumn get reps => integer()();
  RealColumn get rpe => real().nullable()();
  TextColumn get unit => textEnum<WeightUnit>()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
