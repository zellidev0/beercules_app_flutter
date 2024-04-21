import 'package:beercules/ui/widgets/beercules_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BeerculesDialog displays header and description',
      (final WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BeerculesDialog(
          onConfirmPressed: () {},
          onCancelPressed: () {},
          confirmText: 'Confirm',
          headerText: 'Dialog Header',
          descriptionText: 'Dialog Description',
          declineText: 'Decline',
        ),
      ),
    );

    expect(find.text('Dialog Header'), findsOneWidget);
    expect(find.text('Dialog Description'), findsOneWidget);
  });

  testWidgets(
      'BeerculesDialog calls onConfirmPressed when confirm button is pressed',
      (final WidgetTester tester) async {
    bool confirmPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: BeerculesDialog(
          onConfirmPressed: () {
            confirmPressed = true;
          },
          onCancelPressed: () {},
          confirmText: 'Confirm',
          headerText: 'Dialog Header',
          descriptionText: 'Dialog Description',
          declineText: 'Decline',
        ),
      ),
    );

    await tester.tap(find.text('Confirm'));
    await tester.pump();

    expect(confirmPressed, true);
  });

  testWidgets(
      'BeerculesDialog calls onCancelPressed when decline button is pressed',
      (final WidgetTester tester) async {
    bool cancelPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: BeerculesDialog(
          onConfirmPressed: () {},
          onCancelPressed: () {
            cancelPressed = true;
          },
          confirmText: 'Confirm',
          headerText: 'Dialog Header',
          descriptionText: 'Dialog Description',
          declineText: 'Decline',
        ),
      ),
    );

    await tester.tap(find.text('Decline'));
    await tester.pump();

    expect(cancelPressed, true);
  });
}
