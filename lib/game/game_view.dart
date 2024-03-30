import 'dart:math';

import 'package:beercules/common/widgets/beercules_icon_button.dart';
import 'package:beercules/common/widgets/playing_card_container.dart';
import 'package:beercules/game/game_controller_interface.dart';
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
    final GameControllerInterface controller =
        ref.read(providers.gameController.notifier);
    final GameModel model = ref.watch(providers.gameController);

    return ScaffoldWidget(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildCardStack(
            model: model,
            context: context,
            controller: controller,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _buildTopRow(
              controller: controller,
              model: model,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardStack({
    required final GameModel model,
    required final BuildContext context,
    required final GameControllerInterface controller,
  }) =>
      Stack(
        alignment: Alignment.topCenter,
        children: model.cards
            .mapIndexed(
              (final int index, final GameModelCard card) => Transform.rotate(
                angle: index.toDouble() + model.cardTransformSeed,
                child: card.wasPlayed
                    ? const SizedBox.shrink()
                    : _buildCardBackground(
                        context: context,
                        card: card,
                        controller: controller,
                        model: model,
                      ),
              ),
            )
            .toList(),
      );

  Row _buildTopRow({
    required final GameControllerInterface controller,
    required final GameModel model,
  }) =>
      Row(
        children: <Widget>[
          BeerculesIconButton(
            onPressed: controller.goBackToHome,
            icon: Icons.arrow_back_ios_rounded,
          ),
          const Spacer(),
          Text(
            model.cards.where((final _) => !_.wasPlayed).length.toString(),
            style: TextStyles.header4,
          ),
        ],
      );

  Widget _buildCardBackground({
    required final BuildContext context,
    required final GameModelCard card,
    required final GameModel model,
    required final GameControllerInterface controller,
  }) =>
      Transform.translate(
        offset: Offset(
          64,
          44 + Random(card.id.hashCode).nextInt(20).toDouble(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: AspectRatio(
            aspectRatio: 2.5 / 3.5,
            child: RepaintBoundary(
              child: Swipable(
                threshold: 4,
                onSwipeEnd: (final _, final __) async =>
                    controller.selectCard(card: card),
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
