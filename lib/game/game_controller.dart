import 'dart:core';

import 'package:beercules_flutter/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_model.dart';

class GameController extends StateNotifier<GameModel> {
  final NavigationService _navigationService;

  GameController({
    required NavigationService navigationService,
    GameModel? model,
  })  : _navigationService = navigationService,
        super(model ?? defaultModel);

  void pop() async => await _navigationService.pop();

  void decreaseCardAmount() {
    state = state.copyWith(cardsSwiped: state.cardsSwiped + 1);
  }

  void newGame() {
    state = state.copyWith(cards: defaultModel.cards);
    pop();
  }
}
