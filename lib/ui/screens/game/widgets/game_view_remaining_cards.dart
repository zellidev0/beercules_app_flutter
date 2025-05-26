import 'package:beercules/common/theme.dart';
import 'package:beercules/ui/screens/game/game_view.dart';
import 'package:beercules/ui/widgets/beercules_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameViewRemainingCards extends StatelessWidget {
  const GameViewRemainingCards({super.key});

  @override
  Widget build(final BuildContext context) {
    //TODO: fix this
    const amountOfCardsLeft = 0;
    final controller = BlocProvider.of<GameCubit>(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: <Widget>[
          Consumer(
            builder:
                (final _, final WidgetRef ref, final __) => BeerculesIconButton(
                  onPressed: controller.goBackToHome,
                  icon: Icons.arrow_back_ios_rounded,
                ),
          ),
          const Spacer(),
          RepaintBoundary(
            child: Visibility(
              visible: amountOfCardsLeft > 0,
              child: Text(
                amountOfCardsLeft.toString(),
                style: TextStyles.header4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
