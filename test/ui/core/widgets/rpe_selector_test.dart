import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/ui/core/widgets/rpe_selector.dart';

void main() {
  testWidgets('does not show Clear when no value is selected', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: RpeSelector(value: null, onChanged: (_) {})),
    );

    expect(find.text('Clear'), findsNothing);
  });

  testWidgets('shows Clear once a value is selected', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: RpeSelector(value: 8.0, onChanged: (_) {})),
    );

    expect(find.text('Clear'), findsOneWidget);
  });

  testWidgets('tapping Clear reports null', (tester) async {
    double? reported = -1;
    await tester.pumpWidget(
      MaterialApp(
        home: RpeSelector(value: 8.0, onChanged: (v) => reported = v),
      ),
    );

    await tester.tap(find.text('Clear'));
    await tester.pump();

    expect(reported, isNull);
  });

  testWidgets('tapping a chip reports its RPE value', (tester) async {
    double? reported;
    await tester.pumpWidget(
      MaterialApp(
        home: RpeSelector(value: null, onChanged: (v) => reported = v),
      ),
    );

    await tester.tap(find.text('7.0'));
    await tester.pump();

    expect(reported, 7.0);
  });

  testWidgets('minRpe excludes values below the floor', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RpeSelector(value: null, onChanged: (_) {}, minRpe: 6.0),
      ),
    );

    expect(find.text('5.5'), findsNothing);
    expect(find.text('6.0'), findsOneWidget);
  });
}
