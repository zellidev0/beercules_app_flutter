import 'dart:math';

import 'package:beercules/common/theme.dart';
import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/ui/screens/game/game_state.dart';
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
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<GameCubit>(context);
    return BlocBuilder<GameCubit, GameState>(
      builder: (BuildContext context, GameState model) => ScaffoldWidget(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ...model.cards.map(
              (GameStateCard card) => card.wasPlayed
                  ? const SizedBox.shrink()
                  : GameCard(
                      card: card,
                      onSelectCard: (GameStateCard card) async =>
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

  final GameStateCard card;
  final void Function(GameStateCard card) onSelectCard;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  late int _randomTranslation;

  @override
  void initState() {
    super.initState();
    _randomTranslation = Random(widget.card.id.hashCode).nextInt(20);
  }

  @override
  Widget build(BuildContext context) => Transform.rotate(
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
                  onSwipeEnd: (_, __) async => widget.onSelectCard(widget.card),
                  child: PlayingCardContainer(
                    onTap: () => widget.onSelectCard(widget.card),
                    child: Assets.images.logo.image(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

abstract class GameCubit extends Cubit<GameState> {
  GameCubit(super.initialState);

  void pop();
  void dismissCard({required String cardId});
  Future<void> selectCard({required GameStateCard card});
  void goBackToHome();
  void showFinishDialog({
    required void Function() onConfirmPressed,
    required void Function() onCancelPressed,
    required String confirmText,
    required String declineText,
    required String headerText,
    required String descriptionText,
  });
  void newGame();
  void showCustomizedCardActiveSnackbar();
}
