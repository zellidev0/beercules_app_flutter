import 'dart:math';

import 'package:beercules/common.dart';
import 'package:beercules/extensions.dart';
import 'package:beercules/game/game_controller.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/theme.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        children: [
          ...shuffle(model.cards.entries
              .map(
                (cardWithAmount) => List.generate(
                    cardWithAmount.value, (_) => cardWithAmount.key),
              )
              .expand((_) => _)
              .where((key) => !key.contains(basicRule))
              .toList()),
          '${basicRule}_1',
          '${basicRule}_2',
          '${basicRule}_3',
        ]
            .mapIndexed(
              (String cardKey, int index) => Transform.translate(
                offset: Offset(
                    Random().nextInt(10).toDouble(), Random().nextDouble()),
                child: Transform.rotate(
                  angle: index.toDouble() + Random().nextDouble(),
                  child: _buildCardBackground(
                    context: context,
                    cardKey: cardKey,
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
            model.cards.values.reduce((_, __) => _ + __).toString(),
            style: TextStyles.header4,
          ),
        ],
      );

  Widget _buildCardBackground({
    required BuildContext context,
    required String cardKey,
    required GameController controller,
  }) {
    void onSwipe(_) {
      controller.decreaseCardAmount(cardKey: cardKey);
      showDialog(
        context: context,
        builder: (_) => _buildCardForeground(
          context: context,
          controller: controller,
          cardKey: cardKey,
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

  Widget _buildCardForeground({
    required BuildContext context,
    required GameController controller,
    required String cardKey,
  }) =>
      buildCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(72, 0, 72, 16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: _getForegroundPic(cardKey: cardKey),
                ),
              ),
              FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  "game_view.instructions.$cardKey.title",
                  style: TextStyles.header2,
                ).tr(),
              ),
              const SizedBox(height: 16),
              Text(
                "game_view.instructions.$cardKey.description",
                style: TextStyles.body2,
                textAlign: TextAlign.center,
              ).tr(),
            ],
          ),
          onTap: controller.hideCard,
          color: Theme.of(context).colorScheme.primary);

  Widget _getForegroundPic({required String cardKey}) {
    if (cardKey == 'BASIC_RULE_1' ||
        cardKey == 'BASIC_RULE_2' ||
        cardKey == 'BASIC_RULE_3') {
      return Image.asset("assets/images/logo.png");
    }
    return SvgPicture.asset("assets/instructions/${cardKey}_pic.svg");
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
