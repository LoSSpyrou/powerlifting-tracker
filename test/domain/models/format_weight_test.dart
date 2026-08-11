import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/domain/models/format_weight.dart';

void main() {
  group('formatWeight', () {
    test('drops the decimal point for whole numbers', () {
      expect(formatWeight(100), '100');
      expect(formatWeight(100.0), '100');
    });

    test('keeps the decimal for fractional weights', () {
      expect(formatWeight(102.5), '102.5');
      expect(formatWeight(1.25), '1.25');
    });
  });
}
