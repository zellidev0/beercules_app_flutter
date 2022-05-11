import 'dart:core';
import 'dart:math';

import 'package:beercules/common.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
              showConfigIsDefaultMessage: !listEquals(
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

  void newGame({required BuildContext context}) {
    if (state.showConfigIsDefaultMessage) {
      _beerculesCardsProvider.setCurrentToConfig();
      showSnackbar(
        context: context,
        message: 'game_view.customize_cards_used'.tr(),
        duration: const Duration(seconds: 3),
      );
    } else {
      _beerculesCardsProvider.setCurrentToDefault();
    }
    pop();
  }

  static List<GameModelCard> initCards({
    required List<BeerculesCard> cards,
  }) {
    return [
      ...shuffle(
        cards
            .where((element) => !element.isBasicRule)
            .map((card) => List.generate(card.amount, (_) => card))
            .expand((element) => element)
            .map((card) => GameModelCard(
                  key: card.key,
                  isBasicRule: card.isBasicRule,
                  isVictimGlass: card.isVictimGlass,
                ))
            .toList(),
      ),
      ...cards
          .where((element) => element.isBasicRule)
          .map((card) => List.generate(card.amount, (_) => card))
          .expand((element) => element)
          .map((card) => GameModelCard(
                key: card.key,
                isBasicRule: card.isBasicRule,
                isVictimGlass: card.isVictimGlass,
              ))
          .toList(),
    ];
  }

  void goBackToHome() {
    _navigationService.navigateToNamed(
      uri: NavigationService.homeRouteUri,
      beamBackOnPop: false,
    );
  }

  void pop() {
    state = state.copyWith(
      showContinueDialog: false,
      showConfigIsDefaultMessage: false,
    );
    _navigationService.pop();
  }
}
