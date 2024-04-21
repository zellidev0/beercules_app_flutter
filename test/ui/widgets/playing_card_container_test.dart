import 'package:beercules/ui/widgets/playing_card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PlayingCardContainer renders child widget',
      (final WidgetTester tester) async {
    final UniqueKey key = UniqueKey();
    final Container childWidget = Container(key: key);

    await tester.pumpWidget(
      MaterialApp(
        home: PlayingCardContainer(
          child: childWidget,
        ),
      ),
    );

    final Finder childFinder = find.byWidget(childWidget);
    expect(childFinder, findsOneWidget);
  });

  testWidgets('PlayingCardContainer calls onTap callback when tapped',
      (final WidgetTester tester) async {
    bool onTapCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: PlayingCardContainer(
          onTap: () {
            onTapCalled = true;
          },
          child: Container(),
        ),
      ),
    );

    final Finder cardContainerFinder = find.byType(PlayingCardContainer);
    await tester.tap(cardContainerFinder);

    expect(onTapCalled, true);
  });
}
