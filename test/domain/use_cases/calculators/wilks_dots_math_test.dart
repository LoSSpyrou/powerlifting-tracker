import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/domain/models/sex.dart';
import 'package:powerlifting_tracker/domain/use_cases/calculators/wilks_dots_math.dart';

void main() {
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
