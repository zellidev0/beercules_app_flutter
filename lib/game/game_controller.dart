import 'dart:core';
import 'dart:math';

import 'package:beercules/common.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/services/navigation_service.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameController extends StateNotifier<GameModel> {
  final NavigationService _navigationService;
  final BeerculesCardProvider _beerculesCardsProvider;
  RemoveListener? listener;

  GameController({
    required final NavigationService navigationService,
    required final BeerculesCardProvider beerculesCardsProvider,
    final GameModel? model,
  })  : _navigationService = navigationService,
        _beerculesCardsProvider = beerculesCardsProvider,
        super(
          model ??
              GameModel(
                cards: <GameModelCard>[],
                cardTransformSeed: Random().nextInt(10).toDouble(),
                showContinueDialog:
                    !beerculesCardsProvider.currentGameHasBeenStarted(),
              ),
        ) {
    listener = _beerculesCardsProvider
        .addListener((final BeerculesCardProviderModel model) {
      state = state.copyWith(
        cards: initCards(
          seed: state.cardTransformSeed.toInt(),
          cards: model.currentGameCards
              .map(
                (final BeerculesPlayCard card) => GameModelCard(
                  key: card.key,
                  isBasicRule: card.isBasicRule,
                  isVictimGlass: card.isVictimGlass,
                  victimGlassKey: 'OPFERGLAS_LAST',
                  played: card.played,
                  id: card.id,
                ),
              )
              .toList(),
        ),
      );
    });
  }

  @override
  void dispose() {
    listener?.call();
    super.dispose();
  }

  Future<void> dismissCard({required final BuildContext context}) async {
    _navigationService.pop<void>();
    if (state.cards
        .where((final GameModelCard element) => !element.played)
        .isEmpty) {
      await buildAndShowDialog(
        context: context,
        onConfirmPressed: newGame,
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

  void decreaseCardAmount({required final String cardId}) {
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
    required final BuildContext context,
  }) {
    if (_beerculesCardsProvider.configDiffersFromDefault()) {
      showSnackbar(
        context: context,
        message: 'game_view.customize_cards_used'.tr(),
      );
    }
  }

  static List<GameModelCard> initCards({
    required final int seed,
    required final List<GameModelCard> cards,
  }) =>
      <GameModelCard>[
        ...shuffle(
          seed,
          cards
              .where((final GameModelCard element) => !element.isBasicRule)
              .toList(),
        ),
        ...cards.where((final GameModelCard element) => element.isBasicRule),
      ];

  void goBackToHome() {
    _navigationService.push(NavigationServiceRoutes.homeRouteUri);
  }

  void pop() {
    state = state.copyWith(showContinueDialog: false);
    _navigationService.pop<void>();
  }
}
