import 'dart:async';
import 'dart:core';
import 'dart:math';

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

class GameControllerImplementation extends GameController {
  static final int cardTransformSeed = Random().nextInt(10);
  StreamSubscription<List<GamePersistenceServiceCard>>?
      currentCardsStreamSubscription;
  final GameNavigationService navigationService;
  final GamePersistenceService persistenceService;
  GameModel _state = GameModel(
    cards: <GameModelCard>[],
    amountOfCardsLeft: 0,
    shouldShowContinueDialog: false,
  );

  @override
  GameControllerImplementation({
    required this.navigationService,
    required this.persistenceService,
  }) {
    currentCardsStreamSubscription = persistenceService.currentCardsChangeStream
        .listen((final List<GamePersistenceServiceCard> model) {
      final List<GameModelCard> cards = model.map(_mapToGameModelCard).toList();
      _updateStateAndNotifyListeners(
        _state.copyWith(
          cards: cards,
          amountOfCardsLeft:
              cards.where((final GameModelCard card) => !card.wasPlayed).length,
        ),
      );
    });

    final bool shouldShowContinueDialog =
        !persistenceService.currentGameHasBeenStarted();
    _updateStateAndNotifyListeners(
      _state.copyWith(
        shouldShowContinueDialog: shouldShowContinueDialog,
      ),
    );

    if (shouldShowContinueDialog) {
      scheduleMicrotask(
        () => showFinishDialog(
          onConfirmPressed: pop,
          onCancelPressed: () {
            newGame();
            showCustomizedCardActiveSnackbar();
          },
          confirmText: LocaleKeys.game_view_continue_yes.tr(),
          declineText: LocaleKeys.game_view_continue_no.tr(),
          headerText: LocaleKeys.game_view_continue_header.tr(),
          descriptionText: LocaleKeys.game_view_continue_question.tr(),
        ),
      );
    }
  }

  void _updateStateAndNotifyListeners(final GameModel model) {
    _state = model;
    notifyListeners();
  }

  @override
  GameModel get model => _state;

  @override
  void dispose() {
    unawaited(currentCardsStreamSubscription?.cancel());
    super.dispose();
  }

  GameModelCard _mapToGameModelCard(final GamePersistenceServiceCard card) =>
      GameModelCard(
        transformationAngle: cardTransformSeed + card.id.hashCode,
        type: card.type,
        wasPlayed: card.wasPlayed,
        id: card.id,
      );

  @override
  Future<void> dismissCard({required final String cardId}) async {
    navigationService.pop<void>();
    if (_state.cards
        .where((final GameModelCard card) => !card.wasPlayed)
        .isEmpty) {
      showFinishDialog(
        onConfirmPressed: newGame,
        onCancelPressed: () {
          newGame();
          goBackToHome();
        },
        confirmText: LocaleKeys.game_view_finish_yes.tr(),
        declineText: LocaleKeys.game_view_finish_no.tr(),
        headerText: LocaleKeys.game_view_finish_header.tr(),
        descriptionText: LocaleKeys.game_view_finish_question.tr(),
      );
    }
  }

  @override
  Future<void> selectCard({required final GameModelCard card}) async {
    persistenceService.decreaseCurrentGameCardsAmount(cardId: card.id);
    await navigationService
        .showPopup<void>(
          PlayingCard(
            onTap: () => dismissCard(cardId: card.id),
            showLogo: card.type.isBasicRule(),
            isLastVictimGlass: card.type.isVictimGlass() &&
                _state.cards
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

  @override
  void newGame() {
    if (persistenceService.configDiffersFromDefault()) {
      persistenceService.resetToConfig();
    } else {
      persistenceService.setCurrentToDefault();
    }
    pop();
  }

  @override
  void showCustomizedCardActiveSnackbar() {
    if (persistenceService.configDiffersFromDefault()) {
      navigationService.showSnackBar(
        LocaleKeys.game_view_customize_cards_used.tr(),
      );
    }
  }

  @override
  void goBackToHome() => navigationService.goBack();

  @override
  void pop() {
    _updateStateAndNotifyListeners(
      _state.copyWith(shouldShowContinueDialog: false),
    );
    navigationService.pop<void>();
  }

  @override
  void showFinishDialog({
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
