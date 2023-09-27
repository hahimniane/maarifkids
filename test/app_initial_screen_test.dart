import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:maarifkids/Pages/app_initial_page.dart';
import 'package:maarifkids/Pages/login_page.dart'; // Replace with the actual import path of your LoginPage

void main() {
  testWidgets('AppInitialPage should render without errors', (WidgetTester tester) async {
    // Build our AppInitialPage widget.
    await tester.pumpWidget(MaterialApp(
      home: AppInitialPage(),
    ));

    // Verify that the AppInitialPage renders correctly.
    expect(find.byType(AppInitialPage), findsOneWidget);
  });

  testWidgets('Check if the "Welcome!" text is displayed', (WidgetTester tester) async {
    // Build our AppInitialPage widget.
    await tester.pumpWidget(MaterialApp(
      home: AppInitialPage(),
    ));

    // Verify that the "Welcome!" text is displayed.
    expect(find.text('Welcome!'), findsOneWidget);
  });

  testWidgets('Tap on "Devam Et" button navigates to LoginPage', (WidgetTester tester) async {
    // Build our AppInitialPage widget.
    await tester.pumpWidget(MaterialApp(
      home: AppInitialPage(),
    ));

    // Tap on the "Devam Et" button.
    await tester.tap(find.text('Devam Et'));
    await tester.pumpAndSettle(); // Wait for the navigation to complete.

    // Verify that the LoginPage is displayed after tapping the button.
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('Check if the app description text is displayed', (WidgetTester tester) async {
    // Build our AppInitialPage widget.
    await tester.pumpWidget(MaterialApp(
      home: AppInitialPage(),
    ));

    // Verify that the app description text is displayed.
    expect(
      find.text('You can track your children\'s development on a daily, weekly, monthly, and yearly basis with Maarif e-preschool.'),
      findsOneWidget,
    );
  });

  // You can add more test cases to check other aspects of the page such as images, controllers, button styles, etc.

}
