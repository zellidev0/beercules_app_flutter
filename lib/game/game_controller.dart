import 'dart:core';

import 'package:beercules/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_model.dart';

class GameController extends StateNotifier<GameModel> {
  final NavigationService _navigationService;

  GameController({
    required NavigationService navigationService,
    GameModel? model,
  })  : _navigationService = navigationService,
        super(model ?? defaultModel);

  void goBackToHome() async {
    await _navigationService.navigateToNamed(
      uri: NavigationService.homeRouteUri,
      beamBackOnPop: false,
    );
  }

  void hideCard() async => await _navigationService.pop();

  void decreaseCardAmount({required String cardKey}) {
    Map<String, int> newMap = Map<String, int>.from(state.cards);
    newMap[cardKey] = (newMap[cardKey] ?? 0) - 1;
    state = state.copyWith(cards: newMap);
  }

  void newGame() {
    state = state.copyWith(
      cards: defaultModel.cards,
    );
    goBackToHome();
  }
}
