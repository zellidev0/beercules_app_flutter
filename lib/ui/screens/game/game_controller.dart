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
    WidgetsBinding.instance.addPostFrameCallback((final _) => showGameDialog());

    return GameModel(
      cards: <GameModelCard>[],
      amountOfCardsLeft: 0,
    );
  }

  bool activeGameExists() =>
      activeGameDiffersFromDefault() && activeGameDiffersFromCustom();

  bool activeGameDiffersFromDefault() => !gamesAreEqual(
        persistenceService.defaultGame(),
        persistenceService.activeGame(),
      );

  bool activeGameDiffersFromCustom() => !gamesAreEqual(
        persistenceService.customGame(),
        persistenceService.activeGame(),
      );

  bool customizeGameDiffersFromCustom() => !gamesAreEqual(
        persistenceService.customGame(),
        persistenceService.defaultGame(),
      );

  bool gamesAreEqual(
    final GamePersistenceServiceGame? game1,
    final GamePersistenceServiceGame? game2,
  ) {
    if (game1 == null || game2 == null) {
      return false;
    }
    final Map<BeerculesCardType, int> game1Map = game1.cardToAmountMapping;
    final Map<BeerculesCardType, int> game2Map = game2.cardToAmountMapping;
    return game1Map.keys == game2Map.keys &&
        game1Map.keys.every(
          (final BeerculesCardType key) =>
              game1Map[key] == game2Map[key] &&
              game1Map[key] != null &&
              game2Map[key] != null,
        );
  }

  void showGameDialog() {
    final GamePersistenceServiceGame? activeGame =
        persistenceService.activeGame();
    final GamePersistenceServiceGame? customGame =
        persistenceService.customGame();
    final GamePersistenceServiceGame defaultGame =
        persistenceService.defaultGame();

    if ((activeGame == null && customGame == null) ||
        activeGame == defaultGame && customGame == null) {
      state = newDefaultGame();
      return;
    }
    unawaited(
      navigationService
          .showPopup<void>(
            BeerculesGameDialog(
              activeGameRemainingCards: countCardsInGame(activeGame),
              customGameCardsAmount: countCardsInGame(customGame),
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
                  _mapToGameModelCard(persistenceService.defaultGame()).length,
              onNewGame: ({required final bool isCustomGame}) async {
                if (isCustomGame) {
                  state = newConfigGame(customGame!);
                } else {
                  state = newDefaultGame();
                }
                pop();
              },
            ),
          )
          .match(
            (final Object error) => debugPrint(error.toString()),
            (final _) {},
          )
          .run(),
    );
  }

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
                  id: '$entry.key$index',
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
  Future<void> dismissCard({required final String cardId}) async {
    navigationService.pop<void>();
    if (state.cards
        .where((final GameModelCard card) => !card.wasPlayed)
        .isEmpty) {
      showFinishedDialog();
    }
  }

  @override
  Future<void> selectCard({required final GameModelCard card}) async {
    state = state.copyWith(
      amountOfCardsLeft: state.amountOfCardsLeft - 1,
    );
    await persistenceService.decreaseActiveGameCardAmountByOne(card.type);
    await navigationService
        .showPopup<void>(
          PlayingCard(
            onTap: () => dismissCard(cardId: card.id),
            showLogo: card.type.isBasicRule(),
            isLastVictimGlass: card.type.isVictimGlass() &&
                state.cards
                        .where(
                          (final _) => _.type.isVictimGlass() && !_.wasPlayed,
                        )
                        .length ==
                    1,
            cardType: card.type,
          ),
        )
        .run();
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
                  final GamePersistenceServiceGame? customGame =
                      persistenceService.customGame();
                  // if (customGame != null) {
                  //   showGameDialog(customGame);
                  // } else {
                  //   state = newDefaultGame();
                  // }
                },
                onCancelPressed: goBackToHome,
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
