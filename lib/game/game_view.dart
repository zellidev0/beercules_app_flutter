import 'dart:math';

import 'package:beercules/common/widgets/beercules_icon_button.dart';
import 'package:beercules/common/widgets/playing_card_container.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/gen/assets.gen.dart';
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

    return ScaffoldWidget(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ...model.cards.mapIndexed(
            (final int index, final GameModelCard card) => Transform.rotate(
              angle: card.transformationAngle.toDouble(),
              child: card.wasPlayed
                  ? const SizedBox.shrink()
                  : GameCard(
                      card: card,
                      onSelectCard: (final GameModelCard card) async =>
                          controller.selectCard(card: card),
                    ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: <Widget>[
                BeerculesIconButton(
                  onPressed: controller.goBackToHome,
                  icon: Icons.arrow_back_ios_rounded,
                ),
                const Spacer(),
                Text(
                  model.amountOfCardsLeft.toString(),
                  style: TextStyles.header4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameCard extends StatefulWidget {
  const GameCard({
    required this.card,
    required this.onSelectCard,
    super.key,
  });

  final GameModelCard card;
  final void Function(GameModelCard card) onSelectCard;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  late final Random _random;

  @override
  void initState() {
    super.initState();
    _random = Random(widget.card.id.hashCode);
  }

  @override
  Widget build(final BuildContext context) => Transform.translate(
        offset: Offset(
          64,
          44 + _random.nextInt(20).toDouble(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: AspectRatio(
            aspectRatio: 2.5 / 3.5,
            child: RepaintBoundary(
              child: Swipable(
                threshold: 4,
                onSwipeEnd: (final _, final __) async =>
                    widget.onSelectCard(widget.card),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).primaryColorDark),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: PlayingCardContainer(
                      onTap: () {},
                      child: Assets.images.logo.image(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

abstract class GameController extends StateNotifier<GameModel> {
  GameController(super._state);

  void pop();
  void dismissCard({required final String cardId});
  Future<void> selectCard({required final GameModelCard card});
  void goBackToHome();
  void showFinishDialog({
    required final void Function() onConfirmPressed,
    required final void Function() onCancelPressed,
    required final String confirmText,
    required final String declineText,
    required final String headerText,
    required final String descriptionText,
  });
  void newGame();
  void showCustomizedCardActiveSnackbar();
}
