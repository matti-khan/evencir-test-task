import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; 

import 'package:test_task/main.dart';

void main() {
  testWidgets('Dashboard navigation and Home functionality test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify initial state (Home screen)
    // Check for dynamic "Today" text pattern.
    // e.g. "Today, 27 Dec 2025" or just "Today,"
    expect(find.textContaining('Today,'), findsOneWidget);
    
    // Check for Week Tracker in title (Week X/Y)
    expect(find.textContaining('Week'), findsOneWidget);
    
    // Verify Date Strip
    // Since it shows dynamic dates, verify we can find *some* date number. 
    // e.g. current day.
    var now = DateTime.now();
    expect(find.text(now.day.toString()), findsWidgets); // Might find multiple if repeated or in calendar?

    // Verify Tab Navigation
    await tester.tap(find.text('Plan'));
    await tester.pumpAndSettle();
    expect(find.text('Training Calendar'), findsOneWidget);

    await tester.tap(find.text('Mood'));
    await tester.pumpAndSettle();
    expect(find.textContaining('How are you feeling'), findsOneWidget);
  });
}
