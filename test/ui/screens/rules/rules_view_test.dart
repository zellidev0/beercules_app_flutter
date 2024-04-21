import 'package:beercules/ui/screens/rules/rules_view.dart';
import 'package:beercules/ui/widgets/beercules_button.dart';
import 'package:beercules/ui/widgets/beercules_icon_button.dart';
import 'package:beercules/ui/widgets/playing_card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RulesView displays correctly',
      (final WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RulesView(),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(BeerculesIconButton), findsOneWidget);
    expect(find.byType(PlayingCardContainer), findsOneWidget);
    expect(find.byType(BeerculesButton), findsOneWidget);
  });

  testWidgets('RulesView navigates to game route when button is pressed',
      (final WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RulesView(),
      ),
    );

    await tester.tap(find.byType(BeerculesButton));
    await tester.pumpAndSettle();

    expect(find.text('Game Route'), findsOneWidget);
  });
}
