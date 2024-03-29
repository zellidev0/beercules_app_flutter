import 'dart:async';
import 'dart:core';
import 'dart:math';
import 'package:beercules/common/beercules_card_model.dart';
import 'package:beercules/common/utils.dart';
import 'package:beercules/common/widgets/bc_dialog.dart';
import 'package:beercules/game/game_controller_interface.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/game/services/game_navigation_service.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameController extends GameControllerInterface {
  final GameNavigationService _navigationService;
  final BeerculesCardProvider _beerculesCardsProvider;
  RemoveListener? cardsChangedListener;

  GameController({
    required final GameNavigationService navigationService,
    required final BeerculesCardProvider beerculesCardsProvider,
  })  : _navigationService = navigationService,
        _beerculesCardsProvider = beerculesCardsProvider,
        super(
          GameModel(
            cards: <GameModelCard>[],
            cardTransformSeed: Random().nextInt(10),
            shouldShowContinueDialog:
                !beerculesCardsProvider.currentGameHasBeenStarted(),
          ),
        ) {
    cardsChangedListener = _beerculesCardsProvider
        .addListener((final BeerculesCardProviderModel model) {
      state = state.copyWith(
        cards: initCards(
          seed: state.cardTransformSeed,
          cards: model.currentGameCards.map(_mapToGameModelCard).toList(),
        ),
      );
    });
  }

  GameModelCard _mapToGameModelCard(final BeerculesPlayCard card) =>
      GameModelCard(
        type: card.key,
        wasPlayed: card.played,
        id: card.id,
      );

  @override
  void dispose() {
    cardsChangedListener?.call();
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
  void decreaseCardAmount({required final String cardId}) {
    _beerculesCardsProvider.decreaseCurrentGameCardsAmount(cardId: cardId);
  }

  @override
  void newGame() {
    if (_beerculesCardsProvider.configDiffersFromDefault()) {
      _beerculesCardsProvider.setCurrentToConfig();
    } else {
      _beerculesCardsProvider.setCurrentToDefault();
    }
    pop();
  }

  @override
  void showCustomizedCardActiveSnackbar() {
    if (_beerculesCardsProvider.configDiffersFromDefault()) {
      _navigationService.showSnackBar(
        LocaleKeys.game_view_customize_cards_used.tr(),
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
    required final Null Function() onCancelPressed,
    required final String confirmText,
    required final String declineText,
    required final String headerText,
    required final String descriptionText,
  }) =>
      unawaited(
        _navigationService
            .showPopup<void>(
              CustomDialog(
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
