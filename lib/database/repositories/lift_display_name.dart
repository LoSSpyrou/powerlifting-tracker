import '../../shared/models/lift_type.dart';
import '../database.dart';

String liftDisplayName(Lift lift) {
  if (lift.customName != null) return lift.customName!;
  switch (lift.type) {
    case LiftType.squat:
      return 'Squat';
    case LiftType.bench:
      return 'Bench';
    case LiftType.deadlift:
      return 'Deadlift';
    case LiftType.custom:
      return 'Custom';
  }
}
