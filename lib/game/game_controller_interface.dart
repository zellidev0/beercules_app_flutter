import 'package:beercules/game/game_model.dart';
import 'package:riverpod/riverpod.dart';

abstract class GameControllerInterface extends StateNotifier<GameModel> {
  GameControllerInterface(super._state);

  void pop();
  void dismissCard({required final String cardId});
  void decreaseCardAmount({required final String cardId});
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
