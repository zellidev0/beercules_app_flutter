import 'dart:math';

import 'package:beercules/common.dart';
import 'package:beercules/extensions.dart';
import 'package:beercules/game/game_controller.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

const basicRule = 'BASIC_RULE';

class GameView extends ConsumerWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameController controller =
        ref.read(providers.gameController.notifier);
    final GameModel model = ref.watch(providers.gameController);

    return ScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _buildCardStack(
              model: model,
              context: context,
              controller: controller,
            ),
            _buildTopRow(controller: controller, model: model),
          ],
        ),
      ),
    );
  }

  Padding _buildCardStack({
    required GameModel model,
    required BuildContext context,
    required GameController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: model.cards
            .mapIndexed(
              (BeerculesCard card, int index) => Transform.translate(
                offset: Offset(
                    model.cardTransformSeed, model.cardTransformSeed),
                child: Transform.rotate(
                  angle: index.toDouble() + model.cardTransformSeed,
                  child: _buildCardBackground(
                    context: context,
                    card: card,
                    controller: controller,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Row _buildTopRow({
    required GameController controller,
    required GameModel model,
  }) =>
      Row(
        children: [
          buildIconButton(
            onPressed: controller.goBackToHome,
            icon: Icons.arrow_back_ios_rounded,
          ),
          const Spacer(),
          Text(
            model.cards
                .map((_) => _.amount)
                .reduce((_, __) => _ + __)
                .toString(),
            style: TextStyles.header4,
          ),
        ],
      );

  Widget _buildCardBackground({
    required BuildContext context,
    required BeerculesCard card,
    required GameController controller,
  }) {
    void onSwipe(_) {
      controller.decreaseCardAmount(cardKey: card.key);
      showDialog(
        context: context,
        builder: (_) => buildCardForeground(
          context: context,
          onTap: controller.hideCard,
          card: card,
        ),
      );
    }

    return Swipable(
      threshold: 4.0,
      onSwipeDown: onSwipe,
      onSwipeUp: onSwipe,
      onSwipeLeft: onSwipe,
      onSwipeRight: onSwipe,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              // borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Theme.of(context).primaryColorDark),
              borderRadius: BorderRadius.circular(8),
            ),
            child: AspectRatio(
              aspectRatio: 2.5 / 3.5,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showContinueDialog({
    required BuildContext context,
    required GameController controller,
  }) {
    showDialog(
      context: context,
      builder: (_) => Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Proceed last game?',
                          style: TextStyles.header2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Would you like to continue the last game?',
                        style: TextStyles.body1,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16),
                      _buildDialogButtons(controller: controller)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildDialogButtons({required GameController controller}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton(onPressed: controller.goBackToHome, textResource: 'Yes'),
          const SizedBox(width: 32),
          buildButton(
            onPressed: controller.newGame,
            textResource: 'No',
          ),
        ],
      );
}
