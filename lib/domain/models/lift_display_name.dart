import '../../data/services/database.dart';
import 'lift_type.dart';

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
