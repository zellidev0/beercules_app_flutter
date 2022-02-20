import 'package:beercules_flutter/game/game_controller.dart';
import 'package:beercules_flutter/game/game_model.dart';
import 'package:beercules_flutter/providers.dart';
import 'package:beercules_flutter/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameView extends ConsumerWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameController controller =
        ref.read(providers.gameController.notifier);
    final GameModel model = ref.watch(providers.gameController);
    return ScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
