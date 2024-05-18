import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/utils.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/ui/screens/game/game_model.dart';
import 'package:beercules/ui/screens/game/game_view.dart';
import 'package:beercules/ui/screens/game/services/game_navigation_service.dart';
import 'package:beercules/ui/screens/game/services/game_persistence_service.dart';
import 'package:beercules/ui/widgets/beercules_binary_dialog.dart';
import 'package:beercules/ui/widgets/beercules_dialog.dart';
import 'package:beercules/ui/widgets/playing_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_controller.g.dart';

@riverpod
class GameControllerImplementation extends _$GameControllerImplementation
    implements GameController {
  static final int cardTransformSeed = Random().nextInt(10);

  @override
  GameModel build({
    required final GameNavigationService navigationService,
    required final GamePersistenceService persistenceService,
  }) {
    WidgetsBinding.instance
        .addPostFrameCallback((final _) => showPotentialGameDialog());

    return GameModel(
      cards: <GameModelCard>[],
      amountOfCardsLeft: 0,
    );
  }

  bool shouldShowGameDialog({
    required final GamePersistenceServiceGame? activeGame,
    required final GamePersistenceServiceGame? customGame,
    required final GamePersistenceServiceGame defaultGame,
  }) {
    final bool onlyDefaultGameExists = activeGame == null && customGame == null;
    final bool activeGameIsDefaultGame = activeGame == defaultGame;
    final bool customGameExistsNot = customGame == null;
    final bool customGameIsDefault = customGame == defaultGame;

    if (onlyDefaultGameExists ||
        activeGameIsDefaultGame &&
            (customGameExistsNot || customGameIsDefault)) {
      return false;
    }
    return true;
  }

  void showPotentialGameDialog() {
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
      state = newDefaultGame();
      return;
    }
    showGameDialog(
      activeGame: activeGame,
      customGame: customGame,
      defaultGame: defaultGame,
    );
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
                  final List<GameModelCard> cards =
                      _mapToGameModelCard(activeGame!);
                  state = state.copyWith(
                    cards: cards,
                    amountOfCardsLeft: cards.length,
                  );
                  pop();
                },
                defaultGameCardsAmount:
                    _mapToGameModelCard(persistenceService.defaultGame())
                        .length,
                onNewGame: ({required final bool isCustomGame}) async {
                  if (isCustomGame) {
                    state = newConfigGame(customGame!);
                  } else {
                    state = newDefaultGame();
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

  int? countCardsInGame(final GamePersistenceServiceGame? activeGame) =>
      activeGame?.cardToAmountMapping.values.fold<int>(
        0,
        (final int previousValue, final int element) => previousValue + element,
      );

  List<GameModelCard> _mapToGameModelCard(
    final GamePersistenceServiceGame game,
  ) =>
      shuffleCards(
        cards: game.cardToAmountMapping.entries
            .map(
              (final MapEntry<BeerculesCardType, int> entry) =>
                  List<GameModelCard>.generate(
                entry.value,
                (final int index) => GameModelCard(
                  transformationAngle:
                      cardTransformSeed + entry.key.hashCode + index,
                  type: entry.key,
                  wasPlayed: false,
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

  @override
  Future<void> selectCard({required final GameModelCard card}) async {
    state = state.copyWith(
      amountOfCardsLeft: state.amountOfCardsLeft - 1,
      cards: state.cards.map(
        (final GameModelCard cardInList) {
          if (cardInList.id == card.id) {
            return card.copyWith(wasPlayed: true);
          }
          return cardInList;
        },
      ).toList(),
    );
    await persistenceService.decreaseActiveGameCardAmountByOne(card.type);
    (await navigationService
            .showPopup<Unit>(
              PlayingCard(
                onTap: () {
                  navigationService.pop<Unit>(data: unit);
                  if (state.amountOfCardsLeft == 0) {
                    showFinishedDialog();
                  }
                },
                showLogo: card.type.isBasicRule(),
                isLastVictimGlass: card.type.isVictimGlass() &&
                    state.cards
                            .where(
                              (final _) =>
                                  _.type.isVictimGlass() && !_.wasPlayed,
                            )
                            .length ==
                        1,
                cardType: card.type,
              ),
            )
            .run())
        .match(
      (final Object error) => debugPrint(error.toString()),
      (final Option<Unit> dismissed) =>
          dismissed.isNone() && state.amountOfCardsLeft == 0
              ? showFinishedDialog()
              : null,
    );
  }

  GameModel newDefaultGame() {
    final List<GameModelCard> cards =
        _mapToGameModelCard(persistenceService.defaultGame());
    unawaited(persistenceService.resetActiveGameToDefaultGame());
    return state.copyWith(
      cards: cards,
      amountOfCardsLeft: cards.length,
    );
  }

  GameModel newConfigGame(final GamePersistenceServiceGame customGame) {
    final List<GameModelCard> cards = _mapToGameModelCard(customGame);
    unawaited(persistenceService.resetActiveGameToCustomGame());
    return state.copyWith(
      cards: cards,
      amountOfCardsLeft: cards.length,
    );
  }

  @override
  void goBackToHome() => navigationService.goBack();

  @override
  void pop() {
    navigationService.pop<void>();
  }

  void showFinishedDialog() => unawaited(
        navigationService
            .showPopup<void>(
              BeerculesBinaryDialog(
                onConfirmPressed: () {
                  pop();
                  showPotentialGameDialog();
                },
                onCancelPressed: () {
                  pop();
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
            )
            .run(),
      );
}
