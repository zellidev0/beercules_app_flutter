import 'dart:async';
import 'dart:math';

import 'package:beercules/common/widgets/bc_icon_button.dart';
import 'package:beercules/common/widgets/playing_card.dart';
import 'package:beercules/common/widgets/playing_card_container.dart';
import 'package:beercules/game/game_controller.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/theme.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
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
          confirmText: LocaleKeys.game_view_finish_yes.tr(),
          declineText: LocaleKeys.game_view_finish_no.tr(),
          headerText: LocaleKeys.game_view_finish_header.tr(),
          descriptionText: LocaleKeys.game_view_finish_question.tr(),
        ),
      );
    }

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
    required final GameController controller,
  }) =>
      Stack(
        alignment: Alignment.topCenter,
        children: model.cards
            .mapIndexed(
              (final int index, final GameModelCard card) => Transform.rotate(
                angle: index.toDouble() + model.cardTransformSeed,
                child: RepaintBoundary(
                  child: card.played
                      ? const SizedBox.shrink()
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
          BcIconButton(
            onPressed: controller.goBackToHome,
            icon: Icons.arrow_back_ios_rounded,
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
            child: Swipable(
              threshold: 4,
              onSwipeEnd: (final _, final __) async {
                controller.decreaseCardAmount(cardId: card.id);
                await showDialog<void>(
                  context: context,
                  builder: (final _) => PlayingCard(
                    onTap: () => controller.dismissCard(cardId: card.id),
                    showLogo: card.type.isBasicRule(),
                    isLastVictimGlass: card.type.isVictimGlass() &&
                        model.cards
                                .where(
                                  (final _) =>
                                      _.type.isVictimGlass() && !_.played,
                                )
                                .length ==
                            1,
                    cardType: card.type,
                  ),
                );
              },
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
      );
}
