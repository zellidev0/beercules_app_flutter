import 'dart:core';
import 'dart:math';

import 'package:beercules/common.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_model.dart';

class GameController extends StateNotifier<GameModel> {
  final NavigationService _navigationService;
  final BeerculesCardProvider _beerculesCardsProvider;
  RemoveListener? listener;

  GameController({
    required NavigationService navigationService,
    required BeerculesCardProvider beerculesCardsProvider,
    GameModel? model,
  })  : _navigationService = navigationService,
        _beerculesCardsProvider = beerculesCardsProvider,
        super(model ??
            GameModel(
              cards: [],
              cardTransformSeed: Random().nextInt(10).toDouble(),
              showContinueDialog: !listEquals(
                beerculesCardsProvider.state.currentGameCards,
                beerculesCardsProvider.defaultBeerculesCards,
              ),
            )) {
    listener =
        _beerculesCardsProvider.addListener((BeerculesCardProviderModel model) {
      state = state.copyWith(
        cards: initCards(cards: model.currentGameCards),
      );
    });
  }

  @override
  void dispose() {
    listener?.call();
    super.dispose();
  }

  void dismissCard() async => await _navigationService.pop();

  void decreaseCardAmount({required String cardKey}) {
    _beerculesCardsProvider.decreaseCurrentGameCardsAmount(cardKey: cardKey);
  }

  void newGame() {
    _beerculesCardsProvider.setCurrentToDefault();
    pop();
  }

  static List<BeerculesCard> initCards({
    required List<BeerculesCard> cards,
  }) {
    return [
      ...shuffle(
        cards.where((element) => !element.isBasicRule).toList(),
      ),
      ...cards.where((element) => element.isBasicRule).toList(),
    ];
  }

  void goBackToHome() {
    _navigationService.beamBack();
  }

  void pop() {
    state = state.copyWith(showContinueDialog: false);
    _navigationService.pop();
  }
}
