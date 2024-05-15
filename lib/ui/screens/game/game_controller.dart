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
    final GamePersistenceServiceGame? storedActiveGame =
        persistenceService.activeGame();
    final GamePersistenceServiceGame? storedCustomGame =
        persistenceService.customGame();
    if (storedActiveGame == null) {
      if (storedCustomGame == null) {
        final List<GameModelCard> cards =
            _mapToGameModelCard(persistenceService.defaultGame());
        unawaited(persistenceService.resetActiveGameToDefaultGame());
        return GameModel(
          cards: cards,
          amountOfCardsLeft: cards.length,
        );
      } else {
        showConfigVsDefaultDialog(storedCustomGame);
      }
    } else {
      if (storedCustomGame == null) {
        showContinueDialog(storedActiveGame, null);
      } else {
        showContinueDialog(storedActiveGame, storedCustomGame);
      }
    }

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

  void showContinueDialog(
    final GamePersistenceServiceGame activeGame,
    final GamePersistenceServiceGame? customGame,
  ) =>
      scheduleMicrotask(
        () => showDialog(
          onConfirmPressed: () {
            final List<GameModelCard> cards = _mapToGameModelCard(activeGame);
            state = state.copyWith(
              cards: cards,
              amountOfCardsLeft: cards.length,
            );
            pop();
          },
          onCancelPressed: () async {
            pop();
            if (customGame == null) {
              await persistenceService.resetActiveGameToDefaultGame();
              final List<GameModelCard> cards = _mapToGameModelCard(
                persistenceService.activeGame() ??
                    persistenceService.defaultGame(),
              );
              state = state.copyWith(
                cards: cards,
                amountOfCardsLeft: cards.length,
              );
            } else {
              showConfigVsDefaultDialog(customGame);
            }
          },
          confirmText: LocaleKeys.game_view_continue_yes.tr(),
          declineText: LocaleKeys.game_view_continue_no.tr(),
          headerText: LocaleKeys.game_view_continue_header.tr(),
          descriptionText: LocaleKeys.game_view_continue_question.tr(),
        ),
      );

  void showConfigVsDefaultDialog(final GamePersistenceServiceGame customGame) =>
      scheduleMicrotask(
        () => showDialog(
          onConfirmPressed: () {
            newConfigGame(customGame);
            pop();
          },
          onCancelPressed: () {
            newDefaultGame();
            pop();
          },
          confirmText: LocaleKeys.game_view_config_game_yes.tr(),
          declineText: LocaleKeys.game_view_config_game_no.tr(),
          headerText: LocaleKeys.game_view_config_game_header.tr(),
          descriptionText: LocaleKeys.game_view_config_game_question.tr(),
        ),
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
      showDialog(
        onConfirmPressed: () {
          final GamePersistenceServiceGame? customGame =
              persistenceService.customGame();
          if (customGame != null) {
            showConfigVsDefaultDialog(customGame);
          } else {
            newDefaultGame();
          }
        },
        onCancelPressed: goBackToHome,
        confirmText: LocaleKeys.game_view_finish_yes.tr(),
        declineText: LocaleKeys.game_view_finish_no.tr(),
        headerText: LocaleKeys.game_view_finish_header.tr(),
        descriptionText: LocaleKeys.game_view_finish_question.tr(),
      );
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

  void newDefaultGame() {
    final List<GameModelCard> cards =
        _mapToGameModelCard(persistenceService.defaultGame());
    state = state.copyWith(
      cards: cards,
      amountOfCardsLeft: cards.length,
    );
    unawaited(persistenceService.resetActiveGameToDefaultGame());
  }

  void newConfigGame(final GamePersistenceServiceGame customGame) {
    final List<GameModelCard> cards = _mapToGameModelCard(customGame);
    state = state.copyWith(
      cards: cards,
      amountOfCardsLeft: cards.length,
    );
    unawaited(persistenceService.resetActiveGameToCustomGame());
  }

  @override
  void goBackToHome() => navigationService.goBack();

  @override
  void pop() {
    navigationService.pop<void>();
  }

  @override
  void showDialog({
    required final void Function() onConfirmPressed,
    required final void Function() onCancelPressed,
    required final String confirmText,
    required final String declineText,
    required final String headerText,
    required final String descriptionText,
  }) =>
      unawaited(
        navigationService
            .showPopup<void>(
              BeerculesDialog(
                onConfirmPressed: onConfirmPressed,
                onCancelPressed: onCancelPressed,
                confirmText: confirmText,
                declineText: declineText,
                headerText: headerText,
                descriptionText: descriptionText,
              ),
            )
            .match(
              (final Object error) => debugPrint(error.toString()),
              (final _) {},
            )
            .run(),
      );
}
