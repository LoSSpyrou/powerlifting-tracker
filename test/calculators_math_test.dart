import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/features/calculators/one_rep_max_table.dart';
import 'package:powerlifting_tracker/features/calculators/plate_math.dart';
import 'package:powerlifting_tracker/features/calculators/wilks_dots_math.dart';
import 'package:powerlifting_tracker/shared/models/sex.dart';

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

  group('estimateOneRepMax', () {
    test('returns weight unchanged for a single rep at RPE 10', () {
      expect(estimateOneRepMax(weight: 180, reps: 1, rpe: 10), 180);
    });

    test('scales up for submaximal reps/RPE', () {
      final estimate = estimateOneRepMax(weight: 100, reps: 5, rpe: 8);
      expect(estimate, closeTo(100 / 0.811, 0.01));
    });

    test('returns null below the chart\'s supported RPE range', () {
      expect(estimateOneRepMax(weight: 100, reps: 5, rpe: 5), isNull);
    });

    test('returns null for reps beyond the chart', () {
      expect(estimateOneRepMax(weight: 100, reps: 20, rpe: 8), isNull);
    });
  });

  group('wilks/dots', () {
    test(
      'dots and wilks scale up with a heavier total at fixed bodyweight',
      () {
        final lowDots = calculateDots(
          sex: Sex.male,
          bodyweightKg: 83,
          totalKg: 400,
        );
        final highDots = calculateDots(
          sex: Sex.male,
          bodyweightKg: 83,
          totalKg: 600,
        );
        expect(highDots, greaterThan(lowDots));
      },
    );

    test('men and women get different scores for the same numbers', () {
      final men = calculateWilks(sex: Sex.male, bodyweightKg: 83, totalKg: 500);
      final women = calculateWilks(
        sex: Sex.female,
        bodyweightKg: 83,
        totalKg: 500,
      );
      expect(men, isNot(closeTo(women, 0.01)));
    });
  });
}
