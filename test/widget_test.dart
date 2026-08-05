import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/app/app.dart';

void main() {
  testWidgets('App launches to the Log screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: PowerliftingTrackerApp()),
    );

    expect(find.text('Log'), findsWidgets);
  });
}
