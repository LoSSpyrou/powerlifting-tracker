import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/data/services/database.dart';
import 'package:powerlifting_tracker/domain/models/lift_type.dart';
import 'package:powerlifting_tracker/ui/core/widgets/lift_selector.dart';

void main() {
  const lifts = [
    Lift(id: 1, type: LiftType.squat),
    Lift(id: 2, type: LiftType.bench),
    Lift(id: 3, type: LiftType.deadlift),
  ];

  testWidgets('renders a chip per lift, uppercased', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LiftSelector(
            lifts: lifts,
            selectedLiftId: 1,
            onSelected: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('SQUAT'), findsOneWidget);
    expect(find.text('BENCH'), findsOneWidget);
    expect(find.text('DEADLIFT'), findsOneWidget);
  });

  testWidgets('marks the selected lift\'s chip as selected', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LiftSelector(
            lifts: lifts,
            selectedLiftId: 2,
            onSelected: (_) {},
          ),
        ),
      ),
    );

    final chips = tester.widgetList<ChoiceChip>(find.byType(ChoiceChip));
    final selected = chips.where((c) => c.selected).toList();
    expect(selected, hasLength(1));
    expect((selected.single.label as Text).data, 'BENCH');
  });

  testWidgets('tapping a chip reports that lift\'s id', (tester) async {
    int? selectedId;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LiftSelector(
            lifts: lifts,
            selectedLiftId: 1,
            onSelected: (id) => selectedId = id,
          ),
        ),
      ),
    );

    await tester.tap(find.text('DEADLIFT'));
    await tester.pump();

    expect(selectedId, 3);
  });
}
