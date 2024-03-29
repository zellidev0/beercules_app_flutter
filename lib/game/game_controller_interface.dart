import 'package:beercules/game/game_model.dart';
import 'package:riverpod/riverpod.dart';

abstract class GameControllerInterface extends StateNotifier<GameModel> {
  GameControllerInterface(super._state);

  void dismissCard({required final String cardId});
  void decreaseCardAmount({required final String cardId});
  void newGame();
  void showCustomizedCardActiveSnackbar();
  void goBackToHome();
  void pop();
  void showFinishDialog({
    required final void Function() onConfirmPressed,
    required final Null Function() onCancelPressed,
    required final String confirmText,
    required final String declineText,
    required final String headerText,
    required final String descriptionText,
  });
}
