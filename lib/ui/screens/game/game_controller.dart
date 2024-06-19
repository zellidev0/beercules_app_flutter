import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/utils.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/ui/screens/game/game_model.dart';
import 'package:beercules/ui/screens/game/game_view.dart';
import 'package:beercules/ui/screens/game/services/game_ad_service.dart';
import 'package:beercules/ui/screens/game/services/game_navigation_service.dart';
import 'package:beercules/ui/screens/game/services/game_persistence_service.dart';
import 'package:beercules/ui/widgets/beercules_binary_dialog.dart';
import 'package:beercules/ui/widgets/beercules_dialog.dart';
import 'package:beercules/ui/widgets/playing_card.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_controller.g.dart';

@riverpod
class GameControllerImplementation extends _$GameControllerImplementation
    implements GameController {
  @override
  GameModel build({
    required final GameNavigationService navigationService,
    required final GamePersistenceService persistenceService,
    required final GameAdService adService,
  }) {
    WidgetsBinding.instance.addPostFrameCallback(
      (final _) => unawaited(showPotentialGameDialog()),
    );
    unawaited(loadBannerAd());

    return GameModel(
      notYetPlayedCards: <GameModelCard>[],
      amountOfCardsLeft: 0,
      bannerAd: null,
    );
  }

  Future<void> loadBannerAd() async => adService.getBannerAd().then(
        (final BannerAd? ad) {
          state = state.copyWith(bannerAd: ad);
          ref.onDispose(() => ad?.dispose());
        },
        onError: (final Object error) {
          debugPrint('BannerAd failed to load: $error');
        },
      );

  Future<BannerAd?> loadCardAd() async => adService.getCardAd().then(
        (final BannerAd? ad) => ad,
        onError: (final Object error) => null,
      );

  bool shouldShowGameDialog({
    required final GamePersistenceServiceGame? activeGame,
    required final GamePersistenceServiceGame? customGame,
    required final GamePersistenceServiceGame defaultGame,
  }) {
    final bool onlyDefaultGameExists = activeGame == null && customGame == null;
    final bool activeGameIsDefaultGame = activeGame == defaultGame;
    final bool activeGameIsEmpty =
        (activeGame?.cardToAmountMapping.values.sum ?? 0) == 0;
    final bool customGameExistsNot = customGame == null;
    final bool customGameIsDefault = customGame == defaultGame;

    if (onlyDefaultGameExists ||
        activeGameIsEmpty ||
        activeGameIsDefaultGame &&
            (customGameExistsNot || customGameIsDefault)) {
      return false;
    }
    return true;
  }

  Future<void> showPotentialGameDialog() async {
    final GamePersistenceServiceGame? activeGame =
        persistenceService.activeGame();
    final GamePersistenceServiceGame? customGame =
        persistenceService.customGame();
    final GamePersistenceServiceGame defaultGame =
        persistenceService.defaultGame();

    if (!shouldShowGameDialog(
      activeGame: activeGame,
      customGame: customGame,
      defaultGame: defaultGame,
    )) {
      updateState(cards: await newDefaultGame());
    } else {
      showGameDialog(
        activeGame: activeGame,
        customGame: customGame,
        defaultGame: defaultGame,
      );
    }
  }

  void showGameDialog({
    required final GamePersistenceServiceGame? activeGame,
    required final GamePersistenceServiceGame? customGame,
    required final GamePersistenceServiceGame defaultGame,
  }) =>
      unawaited(
        navigationService
            .showPopup<void>(
              BeerculesGameDialog(
                activeGameRemainingCards:
                    (defaultGame == activeGame || customGame == activeGame)
                        ? null
                        : countCardsInGame(activeGame),
                customGameCardsAmount: defaultGame == customGame
                    ? null
                    : countCardsInGame(customGame),
                onContinue: () {
                  updateState(cards: _mapToGameModelCard(activeGame!));
                  pop();
                },
                defaultGameCardsAmount:
                    _mapToGameModelCard(persistenceService.defaultGame())
                        .length,
                onNewGame: ({required final bool isCustomGame}) async {
                  if (isCustomGame) {
                    updateState(cards: await newConfigGame(customGame!));
                  } else {
                    updateState(cards: await newDefaultGame());
                  }
                  pop();
                },
              ),
              canBePoppedViaBackGesture: false,
            )
            .match(
              (final Object error) => debugPrint(error.toString()),
              (final _) {},
            )
            .run(),
      );

  void updateState({
    required final List<GameModelCard> cards,
  }) {
    state = state.copyWith(
      notYetPlayedCards: cards,
      amountOfCardsLeft: cards.length,
    );
  }

  int? countCardsInGame(final GamePersistenceServiceGame? activeGame) =>
      activeGame?.cardToAmountMapping.values.fold<int>(
        0,
        (final int previousValue, final int element) => previousValue + element,
      );

  List<GameModelCard> _mapToGameModelCard(
    final GamePersistenceServiceGame game,
  ) {
    final int cardTransformSeed = Random().nextInt(10);
    return shuffleCards(
      cards: game.cardToAmountMapping.entries
          .map(
            (final MapEntry<BeerculesCardType, int> entry) =>
                List<GameModelCard>.generate(
              entry.value,
              (final int index) => GameModelCard(
                transformationAngle:
                    cardTransformSeed + entry.key.index + index,
                type: entry.key,
                id: '${entry.key}$index',
              ),
            ),
          )
          .flatten
          .toList(),
      conditionToSortFirst: (final GameModelCard card) =>
          card.type == BeerculesCardType.basicRule1 ||
          card.type == BeerculesCardType.basicRule2 ||
          card.type == BeerculesCardType.basicRule3,
    );
  }

  @override
  Future<void> selectCard({required final GameModelCard card}) async {
    final List<GameModelCard> newNotPlayedCards = state.notYetPlayedCards
        .filter((final GameModelCard element) => element.id != card.id)
        .toList();
    state = state.copyWith(
      amountOfCardsLeft: state.amountOfCardsLeft - 1,
      notYetPlayedCards: newNotPlayedCards,
    );
    await persistenceService.decreaseActiveGameCardAmountByOne(card.type);
    final PlayingCardSpecialImage? cardModel = await determineCardModel(
        card: card, newNotPlayedCards: newNotPlayedCards);
    (await navigationService
            .showPopup<Unit>(
              PlayingCard(
                onTap: () {
                  navigationService.pop<Unit>(data: unit);
                  if (state.amountOfCardsLeft == 0) {
                    showFinishedDialog().run();
                  }
                },
                cardSpecialImage: cardModel,
                cardType: card.type,
              ),
            )
            .run())
        .match(
      (final Object error) => debugPrint(error.toString()),
      (final Option<Unit> dismissed) {
        if (cardModel is PlayingCardSpecialImageAdsAdsAds) {
          cardModel.bannerAd?.dispose();
        }
        return dismissed.isNone() && state.amountOfCardsLeft == 0
            ? showFinishedDialog().run()
            : null;
      },
    );
  }

  Future<List<GameModelCard>> newDefaultGame() async {
    final List<GameModelCard> cards = _mapToGameModelCard(
      persistenceService.defaultGame(),
    );
    await persistenceService.resetActiveGameToDefaultGame();
    return cards;
  }

  Future<List<GameModelCard>> newConfigGame(
    final GamePersistenceServiceGame customGame,
  ) async {
    final List<GameModelCard> cards = _mapToGameModelCard(customGame);
    await persistenceService.resetActiveGameToCustomGame();
    return cards;
  }

  @override
  void goBackToHome() => navigationService.goBack();

  @override
  void pop() => navigationService.pop<void>();

  Task<void> showFinishedDialog() => navigationService
      .showPopup<void>(
        BeerculesBinaryDialog(
          onConfirmPressed: () async {
            closePopUp();
            await showPotentialGameDialog();
          },
          onCancelPressed: () {
            closePopUp();
            goBackToHome();
          },
          confirmText: LocaleKeys.game_view_finish_yes.tr(),
          declineText: LocaleKeys.game_view_finish_no.tr(),
          headerText: LocaleKeys.game_view_finish_header.tr(),
          descriptionText: LocaleKeys.game_view_finish_question.tr(),
        ),
      )
      .match(
        (final Object error) => debugPrint(error.toString()),
        (final _) {},
      );

  void closePopUp() {
    pop();
  }

  Future<PlayingCardSpecialImage?> determineCardModel({
    required final GameModelCard card,
    required final List<GameModelCard> newNotPlayedCards,
  }) async {
    if (card.type.isBasicRule()) {
      return const PlayingCardSpecialImage.showLogo();
    }
    if (card.type.isVictimGlass() &&
        newNotPlayedCards.where((final _) => _.type.isVictimGlass()).isEmpty) {
      return const PlayingCardSpecialImage.lastVictimGlass();
    }
    if (card.type.isAdsAdsAds()) {
      return PlayingCardSpecialImage.adsAdsAds(
        bannerAd: await loadCardAd(),
      );
    }
    return null;
  }
}
