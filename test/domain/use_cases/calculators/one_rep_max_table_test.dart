import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/domain/use_cases/calculators/one_rep_max_table.dart';

void main() {
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
}
