import 'dart:core';
import 'dart:math';

import 'package:beercules/common.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_model.dart';

class GameController extends StateNotifier<GameModel> {
  final NavigationService _navigationService;
  final List<BeerculesCard> _beerculesCards;

  GameController({
    required NavigationService navigationService,
    required List<BeerculesCard> beerculesCards,
    GameModel? model,
  })  : _navigationService = navigationService,
        _beerculesCards = beerculesCards,
        super(model ??
            GameModel(
              cards: initCards(beerculesCards),
              cardTransformSeed: Random().nextInt(10).toDouble(),
            ));

  void goBackToHome() async => await _navigationService.navigateToNamed(
        uri: NavigationService.homeRouteUri,
        beamBackOnPop: false,
      );

  void hideCard() async => await _navigationService.pop();

  void decreaseCardAmount({required String cardKey}) {
    state = state.copyWith(
        cards: state.cards
            .map((BeerculesCard card) => card.key == cardKey
                ? card.copyWith(amount: (card.amount - 1).clamp(0, 100000))
                : card)
            .toList());
  }

  void newGame() {
    state = state.copyWith(
      cards: _beerculesCards,
    );
    goBackToHome();
  }

  static List<BeerculesCard> initCards(List<BeerculesCard> beerculesCards) {
    return [
      ...shuffle(
        beerculesCards.where((element) => !element.isBasicRule).toList(),
      ),
      ...beerculesCards.where((element) => element.isBasicRule).toList(),
    ];
  }
}
