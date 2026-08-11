import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/data/services/database.dart';
import 'package:powerlifting_tracker/data/services/database_provider.dart';
import 'package:powerlifting_tracker/ui/features/log/views/log_screen.dart';

void main() {
  testWidgets('logging a set adds it to the today list', (tester) async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const MaterialApp(home: LogScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('SQUAT'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Weight (kg)'),
      '100',
    );
    await tester.enterText(find.widgetWithText(TextFormField, 'Reps'), '5');

    await tester.tap(find.text('Log Set'));
    await tester.pumpAndSettle();

    expect(find.text('Squat'), findsOneWidget);
    expect(find.textContaining('100kg × 5'), findsOneWidget);

    // drift's stream cleanup schedules a zero-duration timer on dispose;
    // flush it before the test ends so pumpWidget's teardown doesn't trip
    // flutter_test's "no pending timers" assertion.
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });

  testWidgets('validation blocks empty submission', (tester) async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const MaterialApp(home: LogScreen()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Log Set'));
    await tester.pumpAndSettle();

    expect(find.text('Enter a weight'), findsOneWidget);
    expect(find.text('Enter reps'), findsOneWidget);
    expect(find.text('No sets logged today yet'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });
}
