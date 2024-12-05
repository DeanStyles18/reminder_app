import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zap/main.dart'; // Import the main file where the app is defined

void main() {
  testWidgets('Reminder App displays the title correctly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const ReminderApp()); // Use ReminderApp instead of MyApp

    // Verify that the title "My Reminders" is displayed.
    expect(find.text('My Reminders'), findsOneWidget);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ReminderApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
