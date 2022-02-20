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
    return ScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Stack(
          alignment: Alignment.center,
          children: model.cards
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
    );
  }

  Widget _buildCardBackground({
    required BuildContext context,
    required String cardKey,
    required GameController controller,
  }) =>
      Swipable(
        onSwipeDown: (_) => showDialog(
          context: context,
          builder: (_) => _buildCardForeground(
            context: context,
            controller: controller,
            cardKey: cardKey,
          ),
        ),
        onSwipeUp: (_) => showDialog(
          context: context,
          builder: (_) => _buildCardForeground(
            context: context,
            controller: controller,
            cardKey: cardKey,
          ),
        ),
        onSwipeLeft: (_) => showDialog(
          context: context,
          builder: (_) => _buildCardForeground(
            context: context,
            controller: controller,
            cardKey: cardKey,
          ),
        ),
        onSwipeRight: (_) => showDialog(
          context: context,
          builder: (_) => _buildCardForeground(
            context: context,
            controller: controller,
            cardKey: cardKey,
          ),
        ),
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

  Widget _buildCardForeground({
    required BuildContext context,
    required GameController controller,
    required String cardKey,
  }) =>
      GestureDetector(
        onTap: controller.popDialog,
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
                              padding: const EdgeInsets.fromLTRB(80, 0, 80, 32),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: SvgPicture.asset(
                                  "assets/instructions/${cardKey}_pic.svg",
                                ),
                              ),
                            ),
                            Text(
                              "game_view.instructions.$cardKey.title",
                              style: TextStyles.header2,
                            ).tr(),
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
