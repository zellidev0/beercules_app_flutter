import 'package:beercules/ui/widgets/beercules_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BeerculesButton displays correct text',
      (final WidgetTester tester) async {
    const Key buttonKey = Key('beercules_button');
    const String buttonText = 'Click Me';
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: BeerculesButton(
            key: buttonKey,
            text: buttonText,
            onPressed: () {},
          ),
        ),
      ),
    );

    final Finder buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    final Finder buttonTextFinder = find.text(buttonText);
    expect(buttonTextFinder, findsOneWidget);
  });

  testWidgets('BeerculesButton calls onPressed callback when pressed',
      (final WidgetTester tester) async {
    bool onPressedCalled = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: BeerculesButton(
            text: 'Click Me',
            onPressed: () {
              onPressedCalled = true;
            },
          ),
        ),
      ),
    );

    final Finder buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();

    expect(onPressedCalled, true);
  });
}
