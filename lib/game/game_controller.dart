import 'dart:core';
import 'dart:math';

import 'package:beercules/common.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
              showContinueDialog:
                  !beerculesCardsProvider.currentGameHasBeenStarted(),
            )) {
    listener =
        _beerculesCardsProvider.addListener((BeerculesCardProviderModel model) {
      state = state.copyWith(
        cards: initCards(
            seed: state.cardTransformSeed.toInt(),
            cards: model.currentGameCards
                .map((card) => GameModelCard(
                      key: card.key,
                      isBasicRule: card.isBasicRule,
                      isVictimGlass: card.isVictimGlass,
                      victimGlassKey: 'OPFERGLAS_LAST',
                      played: card.played,
                      id: card.id,
                    ))
                .toList()),
      );
    });
  }

  @override
  void dispose() {
    listener?.call();
    super.dispose();
  }

  void dismissCard({required BuildContext context}) async {
    await _navigationService.pop();
    if (state.cards.where((element) => !element.played).isEmpty) {
      buildAndShowDialog(
        context: context,
        onConfirmPressed: () {
          newGame();
        },
        onCancelPressed: () {
          newGame();
          goBackToHome();
        },
        confirmTextResource: 'game_view.finish.yes',
        declineTextResource: 'game_view.finish.no',
        headerResource: 'game_view.finish.header',
        descriptionResource: 'game_view.finish.question',
      );
    }
  }

  void decreaseCardAmount({required String cardId}) {
    _beerculesCardsProvider.decreaseCurrentGameCardsAmount(cardId: cardId);
  }

  void newGame() {
    if (_beerculesCardsProvider.configDiffersFromDefault()) {
      _beerculesCardsProvider.setCurrentToConfig();
    } else {
      _beerculesCardsProvider.setCurrentToDefault();
    }
    pop();
  }

  void showCustomizedCardActiveSnackbar({
    required BuildContext context,
  }) {
    if (_beerculesCardsProvider.configDiffersFromDefault()) {
      showSnackbar(
        context: context,
        message: 'game_view.customize_cards_used'.tr(),
        duration: const Duration(seconds: 3),
      );
    }
  }

  static List<GameModelCard> initCards({
    required int seed,
    required List<GameModelCard> cards,
  }) {
    return [
      ...shuffle(
        seed,
        cards.where((element) => !element.isBasicRule).toList(),
      ),
      ...cards.where((element) => element.isBasicRule).toList(),
    ];
  }

  void goBackToHome() {
    _navigationService.navigateToNamed(
      uri: NavigationService.homeRouteUri,
      beamBackOnPop: false,
    );
  }

  void pop() {
    state = state.copyWith(showContinueDialog: false);
    _navigationService.pop();
  }
}
