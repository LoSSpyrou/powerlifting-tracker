import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/app/app.dart';

void main() {
  testWidgets('App launches to the Log screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: PowerliftingTrackerApp()),
    );

    expect(find.text('Log'), findsWidgets);

    // drift's stream cleanup schedules a zero-duration timer on dispose;
    // flush it before the test ends so pumpWidget's teardown doesn't trip
    // flutter_test's "no pending timers" assertion.
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });
}
