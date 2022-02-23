import 'dart:core';

import 'package:beercules_flutter/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_model.dart';

class GameController extends StateNotifier<GameModel> {
  final NavigationService _navigationService;

  GameController({
    required NavigationService navigationService,
    required GameModel model,
  })  : _navigationService = navigationService,
        super(model);

  void cartSelected() {
    print("sec");
  }

  void pop() async {
    print((await _navigationService.pop()).toString());
  }

  void decreaseCardAmount() {
    state = state.copyWith(cardsSwiped: state.cardsSwiped - 1);
  }
}
