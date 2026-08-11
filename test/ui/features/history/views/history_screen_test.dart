import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/data/repositories/log_repository.dart';
import 'package:powerlifting_tracker/data/services/database.dart';
import 'package:powerlifting_tracker/data/services/database_provider.dart';
import 'package:powerlifting_tracker/domain/models/lift_type.dart';
import 'package:powerlifting_tracker/ui/features/history/views/history_screen.dart';

void main() {
  testWidgets('shows an empty state when the lift has no sets', (tester) async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const MaterialApp(home: HistoryScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('SQUAT'), findsOneWidget);
    expect(find.text('No sets logged for this lift yet'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });

  testWidgets('lists previously logged sets for the selected lift', (
    tester,
  ) async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final repository = LogRepository(db);
    // A one-shot select, not watchLifts().first -- draining a live drift
    // stream before the widget test's pump-controlled clock is running
    // leaves its zero-duration cleanup timer dangling.
    final squatId = (await db.select(db.lifts).get()).first.id;
    await repository.logSet(
      liftId: squatId,
      weight: 120,
      reps: 5,
      rpe: 8,
      unit: WeightUnit.kg,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const MaterialApp(home: HistoryScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('120kg × 5'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });
}
