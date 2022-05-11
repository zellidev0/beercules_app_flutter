import 'package:beercules/common.dart';
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
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameController controller =
        ref.read(providers.gameController.notifier);
    final GameModel model = ref.watch(providers.gameController);

    if (model.showContinueDialog) {
      Future.delayed(Duration.zero, () {
        buildAndShowDialog(
            context: context,
            onConfirmPressed: controller.pop,
            onCancelPressed: () => controller.newGame(context: context),
            confirmTextResource: 'game_view.continue.yes',
            declineTextResource: 'game_view.continue.no',
            headerResource: 'game_view.continue.header',
            descriptionResource: 'game_view.continue.question');
      });
    }

    return ScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
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
    required GameModel model,
    required BuildContext context,
    required GameController controller,
  }) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: model.cards
          .mapIndexed(
            (int index, GameModelCard card) => Transform.rotate(
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
            model.cards.where((_) => !_.played).length.toString(),
            style: TextStyles.header4,
          ),
        ],
      );

  Widget _buildCardBackground({
    required BuildContext context,
    required GameModelCard card,
    required GameModel model,
    required GameController controller,
  }) {
    void onSwipe(_, __) {
      controller.decreaseCardAmount(cardId: card.id);
      showDialog(
        context: context,
        builder: (_) => buildCardForeground(
          context: context,
          onTap: controller.dismissCard,
          showLogo: card.isBasicRule,
          showSkullAnimation: card.isVictimGlass &&
              model.cards.where((element) => element.isVictimGlass).length == 1,
          resourceKey: card.isVictimGlass &&
                  model.cards
                          .where((element) => element.isVictimGlass)
                          .length ==
                      1
              ? card.victimGlassKey
              : card.key,
        ),
      );
    }

    return Swipable(
      threshold: 0.3,
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
                  padding: const EdgeInsets.all(32.0),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
