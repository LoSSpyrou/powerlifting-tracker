import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/domain/use_cases/calculators/plate_math.dart';

void main() {
  group('roundToLoadable', () {
    test('rounds to the nearest 2.5kg step', () {
      expect(roundToLoadable(123.3), 122.5);
      expect(roundToLoadable(121.3), 122.5);
      expect(roundToLoadable(100), 100);
    });
  });

  group('calculatePlates', () {
    test('splits an exact target evenly across denominations', () {
      final result = calculatePlates(targetWeight: 100, barWeight: 20);
      expect(result.perSide, [25, 15]);
      expect(result.achievedTotal, 100);
    });

    test('falls back to the closest loadable total when target is uneven', () {
      final result = calculatePlates(targetWeight: 101, barWeight: 20);
      expect(result.achievedTotal, 100);
    });

    test('needs no plates when target is at or below bar weight', () {
      final result = calculatePlates(targetWeight: 20, barWeight: 20);
      expect(result.perSide, isEmpty);
      expect(result.achievedTotal, 20);
    });
  });
}
