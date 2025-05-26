import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/services/navigation_service/navigation_service.dart';
import 'package:beercules/ui/screens/game/game_state.dart';
import 'package:beercules/ui/screens/game/game_view.dart';
import 'package:beercules/ui/screens/game/services/game_persistence_service.dart';
import 'package:beercules/ui/widgets/beercules_dialog.dart';
import 'package:beercules/ui/widgets/playing_card.dart';
import 'package:easy_localization/easy_localization.dart';

class GameCubitImplementation extends GameCubit {
  static int cardTransformSeed = Random().nextInt(10);
  StreamSubscription<List<GamePersistenceServiceCard>>?
  currentCardsStreamSubscription;
  NavigationService navigationService;
  GamePersistenceService persistenceService;

  @override
  GameCubitImplementation({
    required this.navigationService,
    required this.persistenceService,
  }) : super(
         GameState(
           cards: <GameStateCard>[],
           amountOfCardsLeft: 0,
           shouldShowContinueDialog: false,
         ),
       ) {
    currentCardsStreamSubscription = persistenceService.currentCardsChangeStream
        .listen((List<GamePersistenceServiceCard> model) {
          var cards = model.map(_mapToGameModelCard).toList();
          emit(
            state.copyWith(
              cards: cards,
              amountOfCardsLeft:
                  cards.where((GameStateCard card) => !card.wasPlayed).length,
            ),
          );
        });

    var shouldShowContinueDialog =
        !persistenceService.currentGameHasBeenStarted();
    emit(state.copyWith(shouldShowContinueDialog: shouldShowContinueDialog));
    if (shouldShowContinueDialog) {
      scheduleMicrotask(
        () => showFinishDialog(
          onConfirmPressed: pop,
          onCancelPressed: () {
            newGame();
            showCustomizedCardActiveSnackbar();
          },
          confirmText: LocaleKeys.game_view_finish_yes.tr(),
          declineText: LocaleKeys.game_view_finish_no.tr(),
          headerText: LocaleKeys.game_view_popup_header.tr(),
          descriptionText: LocaleKeys.game_view_popup_continue_question.tr(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    unawaited(currentCardsStreamSubscription?.cancel());
    return super.close();
  }

  GameStateCard _mapToGameModelCard(GamePersistenceServiceCard card) =>
      GameStateCard(
        transformationAngle: cardTransformSeed + card.id.hashCode,
        type: card.type,
        wasPlayed: card.wasPlayed,
        id: card.id,
      );

  @override
  Future<void> dismissCard({required String cardId}) async {
    navigationService.pop<void>();
    if (state.cards.where((GameStateCard card) => !card.wasPlayed).isEmpty) {
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
  Future<void> selectCard({required GameStateCard card}) async {
    persistenceService.decreaseCurrentGameCardsAmount(cardId: card.id);
    await navigationService.showPopup<void>(
      PlayingCard(
        onTap: () => dismissCard(cardId: card.id),
        showLogo: card.type.isBasicRule(),
        isLastVictimGlass:
            card.type.isVictimGlass() &&
            state.cards
                    .where((it) => it.type.isVictimGlass() && !it.wasPlayed)
                    .length ==
                1,
        cardType: card.type,
      ),
    );
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
      // TODO: show snackbar
      // navigationService.showSnackBar(
      //   LocaleKeys.game_view_customize_cards_used.tr(),
      // );
    }
  }

  @override
  void goBackToHome() => navigationService.goBack();

  @override
  void pop() {
    emit(state.copyWith(shouldShowContinueDialog: false));
    navigationService.pop<void>();
  }

  @override
  void showFinishDialog({
    required void Function() onConfirmPressed,
    required void Function() onCancelPressed,
    required String confirmText,
    required String declineText,
    required String headerText,
    required String descriptionText,
  }) => unawaited(
    navigationService.showPopup<void>(
      BeerculesDialog(
        onConfirmPressed: onConfirmPressed,
        onCancelPressed: onCancelPressed,
        confirmText: confirmText,
        declineText: declineText,
        headerText: headerText,
        descriptionText: descriptionText,
      ),
    ),
  );
}
