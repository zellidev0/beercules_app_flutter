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
}
