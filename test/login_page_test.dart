import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maarifkids/parent_module/login_page.dart';


import 'package:provider/provider.dart';

import 'package:maarifkids/Providers/Providers.dart'; // Replace with the actual import path of your Providers

void main() {
  testWidgets('LoginPage should render without errors',
      (WidgetTester tester) async {
    // Create a TestThemeProvider to use in the test.
    final themeProvider = TestThemeProvider();

    // Create a MultiProvider with the required providers.
    final providers = MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
        // Add other providers as needed for your test.
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );

    // Build the widget tree with the MultiProvider.
    await tester.pumpWidget(providers);

    expect(find.byType(LoginPage), findsOneWidget);
  });
  testWidgets('LoginPage should check if there are two text input fields', (WidgetTester tester) async {
    final themeProvider = TestThemeProvider();
    final providers = MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );

    await tester.pumpWidget(providers);

    expect(find.byType(TextField), findsAtLeastNWidgets(2));
    // expect(find.byKey(Key('passwordField')), findsOneWidget);
  });
  testWidgets('check if giris button exists', (WidgetTester tester) async {
    final themeProvider = TestThemeProvider();
    final providers = MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );

    await tester.pumpWidget(providers);

    expect(find.byKey(Key('giris_button')), findsOneWidget);
    // expect(find.byKey(Key('passwordField')), findsOneWidget);
  });
}

class TestThemeProvider extends ThemeProvider {
  // Implement methods and properties needed for testing.
  // For example, you can override changeUserType if needed.
}
