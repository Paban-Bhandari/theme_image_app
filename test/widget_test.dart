// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:theme_image_app/main.dart';

void main() {
  group('Theme Image App Tests', () {
    testWidgets('App should start with light theme', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the app starts with light theme
      expect(find.text('Theme Image App'), findsOneWidget);
      expect(find.text('Current Theme: Light Mode'), findsOneWidget);
    });

    testWidgets('Theme toggle should work', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Find and tap the theme toggle button (more specific)
      final themeToggle = find.byWidgetPredicate(
        (widget) =>
            widget is GestureDetector && widget.child is AnimatedBuilder,
      );
      await tester.tap(themeToggle);
      await tester.pump();

      // Verify that the theme has changed to dark mode
      expect(find.text('Current Theme: Dark Mode'), findsOneWidget);
    });

    testWidgets('Image selector button should be present', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the image selector button is present
      expect(find.text('Select Image'), findsOneWidget);
      expect(find.byIcon(Icons.add_a_photo), findsOneWidget);
    });

    testWidgets('No images message should be displayed initially', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the "No Images Selected" message is displayed
      expect(find.text('No Images Selected'), findsOneWidget);
    });

    testWidgets('App should have proper app bar', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the app bar is present with correct title
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Theme Image App'), findsOneWidget);
    });
  });
}
