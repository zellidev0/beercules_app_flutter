import 'package:beercules/common/theme.dart';
import 'package:beercules/ui/screens/game/game_model.dart';
import 'package:beercules/ui/screens/game/game_providers.dart';
import 'package:beercules/ui/widgets/beercules_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameViewRemainingCards extends StatelessWidget {
  const GameViewRemainingCards({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Align(
        alignment: Alignment.topCenter,
        child: Row(
          children: <Widget>[
            Consumer(
              builder: (final _, final WidgetRef ref, final __) =>
                  BeerculesIconButton(
                onPressed: ref.read(gameControllerProvider).goBackToHome,
                icon: Icons.arrow_back_ios_rounded,
              ),
            ),
            const Spacer(),
            Consumer(
              builder: (final _, final WidgetRef ref, final __) {
                final int? amountOfCardsLeft = ref.watch(
                  gameModelProvider.select(
                    (final GameModel value) => value.amountOfCardsLeft,
                  ),
                );
                return RepaintBoundary(
                  child: Visibility(
                    visible: amountOfCardsLeft != null && amountOfCardsLeft > 0,
                    child: Text(
                      amountOfCardsLeft.toString(),
                      style: TextStyles.header4,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
}
