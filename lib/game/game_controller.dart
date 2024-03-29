import 'dart:async';
import 'dart:core';
import 'dart:math';
import 'package:beercules/common/beercules_card_model.dart';
import 'package:beercules/common/utils.dart';
import 'package:beercules/common/widgets/bc_dialog.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/services/navigation_service/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameController extends StateNotifier<GameModel> {
  final NavigationService _navigationService;
  final BeerculesCardProvider _beerculesCardsProvider;
  RemoveListener? listener;

  GameController({
    required final NavigationService navigationService,
    required final BeerculesCardProvider beerculesCardsProvider,
  })  : _navigationService = navigationService,
        _beerculesCardsProvider = beerculesCardsProvider,
        super(
          GameModel(
            cards: <GameModelCard>[],
            cardTransformSeed: Random().nextInt(10),
            showContinueDialog:
                !beerculesCardsProvider.currentGameHasBeenStarted(),
          ),
        ) {
    listener = _beerculesCardsProvider
        .addListener((final BeerculesCardProviderModel model) {
      state = state.copyWith(
        cards: initCards(
          seed: state.cardTransformSeed,
          cards: model.currentGameCards
              // .take(3)
              .map(
                (final BeerculesPlayCard card) => GameModelCard(
                  type: card.key,
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

  Future<void> dismissCard({required final String cardId}) async {
    _navigationService.pop<void>();
    if (state.cards
        .where((final GameModelCard element) => !element.played)
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
              .where(
                (final GameModelCard element) => !element.type.isBasicRule(),
              )
              .toList(),
        ),
        ...cards
            .where((final GameModelCard element) => element.type.isBasicRule()),
      ];

  void goBackToHome() => _navigationService.goBack();

  void pop() {
    state = state.copyWith(showContinueDialog: false);
    _navigationService.pop<void>();
  }

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
              BcDialog(
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
