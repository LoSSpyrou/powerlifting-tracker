import 'package:drift/drift.dart';
import '../../shared/models/lift_type.dart';

@DataClassName('Lift')
class Lifts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => textEnum<LiftType>()();
  TextColumn get customName => text().nullable()();
}
