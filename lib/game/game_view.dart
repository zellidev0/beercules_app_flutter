import 'dart:async';

import 'package:beercules/common/widgets/basic_card.dart';
import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/game/game_controller.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class GameView extends ConsumerWidget {
  const GameView({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final GameController controller =
        ref.read(providers.gameController.notifier);
    final GameModel model = ref.watch(providers.gameController);

    if (model.showContinueDialog) {
      scheduleMicrotask(
        () => controller.showFinishDialog(
          onConfirmPressed: controller.pop,
          onCancelPressed: () {
            controller
              ..newGame()
              ..showCustomizedCardActiveSnackbar(context: context);
          },
          confirmTextResource: 'game_view.continue.yes',
          declineTextResource: 'game_view.continue.no',
          headerResource: 'game_view.continue.header',
          descriptionResource: 'game_view.continue.question',
        ),
      );
    }

    return ScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _buildCardStack(
              model: model,
              context: context,
              controller: controller,
            ),
            _buildTopRow(
              controller: controller,
              model: model,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardStack({
    required final GameModel model,
    required final BuildContext context,
    required final GameController controller,
  }) =>
      Stack(
        alignment: Alignment.bottomCenter,
        children: model.cards
            .mapIndexed(
              (final int index, final GameModelCard card) => Transform.rotate(
                angle: index.toDouble() + model.cardTransformSeed,
                child: RepaintBoundary(
                  child: card.played
                      ? Container()
                      : _buildCardBackground(
                          context: context,
                          card: card,
                          controller: controller,
                          model: model,
                        ),
                ),
              ),
            )
            .toList(),
      );

  Row _buildTopRow({
    required final GameController controller,
    required final GameModel model,
  }) =>
      Row(
        children: <Widget>[
          BcButton(
            onPressed: controller.goBackToHome,
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          const Spacer(),
          Text(
            model.cards.where((final _) => !_.played).length.toString(),
            style: TextStyles.header4,
          ),
        ],
      );

  Widget _buildCardBackground({
    required final BuildContext context,
    required final GameModelCard card,
    required final GameModel model,
    required final GameController controller,
  }) {
    Future<void> onSwipe(final _, final __) async {
      controller.decreaseCardAmount(cardId: card.id);
      await showDialog<void>(
        context: context,
        builder: (final _) => CardForeground(
          onTap: controller.dismissCard,
          showLogo: card.isBasicRule,
          showSkullAnimation: card.isVictimGlass &&
              model.cards
                      .where((final _) => _.isVictimGlass && !_.played)
                      .length ==
                  1,
          resourceKey: card.isVictimGlass &&
                  model.cards
                          .where((final _) => _.isVictimGlass && !_.played)
                          .length ==
                      1
              ? card.victimGlassKey
              : card.key,
        ),
      );
    }

    return Swipable(
      threshold: 4,
      onSwipeEnd: onSwipe,
      child: Padding(
        padding: const EdgeInsets.all(64),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(color: Theme.of(context).primaryColorDark),
                borderRadius: BorderRadius.circular(8),
              ),
              child: AspectRatio(
                aspectRatio: 2.5 / 3.5,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
