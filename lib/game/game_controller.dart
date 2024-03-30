import 'dart:async';
import 'dart:core';
import 'dart:math';
import 'package:beercules/common/utils.dart';
import 'package:beercules/common/widgets/beercules_dialog.dart';
import 'package:beercules/common/widgets/playing_card.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/game/game_view.dart';
import 'package:beercules/game/services/game_navigation_service.dart';
import 'package:beercules/game/services/game_persistence_service.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameControllerImplementation extends GameController {
  static final int cardTransformSeed = Random().nextInt(10);
  final GameNavigationService _navigationService;
  final GamePersistenceService _persistenceService;
  StreamSubscription<List<GamePersistenceServiceCard>>?
      currentCardsStreamSubscription;

  GameControllerImplementation({
    required final GameNavigationService navigationService,
    required final GamePersistenceService persistenceService,
  })  : _navigationService = navigationService,
        _persistenceService = persistenceService,
        super(
          GameModel(
            cards: <GameModelCard>[],
            amountOfCardsLeft: 0,
            shouldShowContinueDialog:
                !persistenceService.currentGameHasBeenStarted(),
          ),
        ) {
    currentCardsStreamSubscription = _persistenceService
        .currentCardsChangeStream
        .listen((final List<GamePersistenceServiceCard> model) {
      final List<GameModelCard> cards = initCards(
        cards: model.map(_mapToGameModelCard).toList(),
      );
      state = state.copyWith(
        cards: cards,
        amountOfCardsLeft:
            cards.where((final GameModelCard card) => !card.wasPlayed).length,
      );
    });
    if (state.shouldShowContinueDialog) {
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

  GameModelCard _mapToGameModelCard(final GamePersistenceServiceCard card) =>
      GameModelCard(
        transformationAngle: cardTransformSeed + card.id.hashCode,
        type: card.type,
        wasPlayed: card.wasPlayed,
        id: card.id,
      );

  @override
  void dispose() {
    unawaited(currentCardsStreamSubscription?.cancel());
    super.dispose();
  }

  @override
  Future<void> dismissCard({required final String cardId}) async {
    _navigationService.pop<void>();
    if (state.cards
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
    _persistenceService.decreaseCurrentGameCardsAmount(cardId: card.id);
    await _navigationService
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

  @override
  void newGame() {
    if (_persistenceService.configDiffersFromDefault()) {
      _persistenceService.resetToConfig();
    } else {
      _persistenceService.setCurrentToDefault();
    }
    pop();
  }

  @override
  void showCustomizedCardActiveSnackbar() {
    if (_persistenceService.configDiffersFromDefault()) {
      _navigationService.showSnackBar(
        LocaleKeys.game_view_customize_cards_used.tr(),
      );
    }
  }

  static List<GameModelCard> initCards({
    required final List<GameModelCard> cards,
  }) =>
      <GameModelCard>[
        ...shuffle(
          cardTransformSeed,
          cards
              .where((final GameModelCard card) => !card.type.isBasicRule())
              .toList(),
        ),
        ...cards.where((final GameModelCard card) => card.type.isBasicRule()),
      ];

  @override
  void goBackToHome() => _navigationService.goBack();

  @override
  void pop() {
    state = state.copyWith(shouldShowContinueDialog: false);
    _navigationService.pop<void>();
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
        _navigationService
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
