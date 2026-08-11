import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/data/services/database.dart';
import 'package:powerlifting_tracker/domain/models/lift_display_name.dart';
import 'package:powerlifting_tracker/domain/models/lift_type.dart';

void main() {
  group('liftDisplayName', () {
    test('capitalizes the built-in lift types', () {
      expect(liftDisplayName(const Lift(id: 1, type: LiftType.squat)), 'Squat');
      expect(liftDisplayName(const Lift(id: 2, type: LiftType.bench)), 'Bench');
      expect(
        liftDisplayName(const Lift(id: 3, type: LiftType.deadlift)),
        'Deadlift',
      );
    });

    test('prefers customName over the generic "Custom" label', () {
      expect(
        liftDisplayName(
          const Lift(id: 4, type: LiftType.custom, customName: 'Log Press'),
        ),
        'Log Press',
      );
    });

    test('falls back to "Custom" when a custom lift has no name', () {
      expect(
        liftDisplayName(const Lift(id: 5, type: LiftType.custom)),
        'Custom',
      );
    });
  });
}
