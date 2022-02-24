import 'package:beercules_flutter/common.dart';
import 'package:beercules_flutter/extensions.dart';
import 'package:beercules_flutter/game/game_controller.dart';
import 'package:beercules_flutter/game/game_model.dart';
import 'package:beercules_flutter/providers.dart';
import 'package:beercules_flutter/scaffold_widget.dart';
import 'package:beercules_flutter/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class GameView extends ConsumerWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameController controller =
        ref.read(providers.gameController.notifier);
    final GameModel model = ref.watch(providers.gameController);
    Future.delayed(Duration.zero, () {
      if (model.cardsSwiped == 0) {
        showDialog(
          context: context,
          builder: (_) => Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32),
                    )),
                child: Column(
                  children: [
                    const Text('Continue'),
                    const Text('Would you like to continue the last game?'),
                    Row(
                      children: [
                        buildButton(
                            onPressed: controller.pop, textResource: 'Yes'),
                        buildButton(
                            onPressed: controller.newGame, textResource: 'No'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });

    return ScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(64),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: model.cards.entries
                    .map((cardWithAmount) => List.generate(
                        cardWithAmount.value, (_) => cardWithAmount.key))
                    .expand((_) => _)
                    .mapIndexed(
                      (String cardKey, int index) => Transform.rotate(
                        angle: index.toDouble(),
                        child: _buildCardBackground(
                          context: context,
                          cardKey: cardKey,
                          controller: controller,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: controller.pop,
                ),
                const Spacer(),
                Text(
                  (model.cards.values
                              .reduce((value, element) => value + element) -
                          model.cardsSwiped)
                      .toString(),
                  style: TextStyles.header4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardBackground({
    required BuildContext context,
    required String cardKey,
    required GameController controller,
  }) {
    void onSwipe(_) {
      controller.decreaseCardAmount();
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
      onSwipeDown: onSwipe,
      onSwipeUp: onSwipe,
      onSwipeLeft: onSwipe,
      onSwipeRight: onSwipe,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).primaryColorDark),
        ),
        child: AspectRatio(
          aspectRatio: 2.5 / 3.5,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset("assets/images/logo.png"),
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
      GestureDetector(
        onTap: controller.pop,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: AspectRatio(
                    aspectRatio: 2.5 / 3.5,
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(72, 0, 72, 16),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: SvgPicture.asset(
                                  "assets/instructions/${cardKey}_pic.svg",
                                ),
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
