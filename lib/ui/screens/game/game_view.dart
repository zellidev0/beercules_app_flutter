import 'dart:math';

import 'package:beercules/common/theme.dart';
import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/ui/screens/game/game_model.dart';
import 'package:beercules/ui/widgets/beercules_icon_button.dart';
import 'package:beercules/ui/widgets/playing_card_container.dart';
import 'package:beercules/ui/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class GameView extends StatelessWidget {
  const GameView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final GameController controller = BlocProvider.of<GameController>(context);
    return BlocBuilder<GameController, GameModel>(
      builder: (final BuildContext context, final GameModel model) =>
          ScaffoldWidget(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ...model.cards.map(
              (final GameModelCard card) => card.wasPlayed
                  ? const SizedBox.shrink()
                  : GameCard(
                      card: card,
                      onSelectCard: (final GameModelCard card) async =>
                          controller.selectCard(card: card),
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
  late final int _randomTranslation;

  @override
  void initState() {
    super.initState();
    _randomTranslation = Random(widget.card.id.hashCode).nextInt(20);
  }

  @override
  Widget build(final BuildContext context) => Transform.rotate(
        angle: widget.card.transformationAngle.toDouble(),
        child: Transform.translate(
          offset: Offset(
            64,
            44 + _randomTranslation.toDouble(),
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
                  child: PlayingCardContainer(
                    onTap: () {},
                    child: Assets.images.logo.image(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

abstract class GameController extends Cubit<GameModel> {
  GameController(super.initialState);

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
