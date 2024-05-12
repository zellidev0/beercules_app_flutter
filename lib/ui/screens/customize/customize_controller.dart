import 'dart:async';
import 'dart:core';

import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/ui/screens/customize/customize_model.dart';
import 'package:beercules/ui/screens/customize/customize_view.dart';
import 'package:beercules/ui/screens/customize/services/customize_navigation_service.dart';
import 'package:beercules/ui/screens/customize/services/customize_persistence_service.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customize_controller.g.dart';

@riverpod
class CustomizeControllerImplementation
    extends _$CustomizeControllerImplementation implements CustomizeController {
  @override
  CustomizeModel build({
    required final CustomizeNavigationService navigationService,
    required final CustomizePersistenceService persistenceService,
  }) {
    List<CustomizePersistenceServiceModelCard>? customGame =
        persistenceService.getCustomGame();
    if (customGame == null || customGame.isEmpty) {
      customGame = persistenceService.getDefaultGame();
    }
    return CustomizeModel(
      selectedCardType: null,
      cards: customGame
          .map(
            (final CustomizePersistenceServiceModelCard card) =>
                CustomizeModelCard(amount: card.amount, type: card.type),
          )
          .toList(),
    );
  }

  @override
  void goBackToHome() => navigationService.goBack();

  @override
  void showCard({
    required final BeerculesCardType cardType,
    required final Widget widget,
  }) {
    unawaited(navigationService.showPopup<void>(widget).run());
    state = state.copyWith(selectedCardType: cardType);
  }

  @override
  void modifyCardAmount() {
    state = state.copyWith(
      cards: state.cards
          .map(
            (final CustomizeModelCard card) =>
                card.type == state.selectedCardType
                    ? card.copyWith(amount: (card.amount + 1) % 6)
                    : card,
          )
          .toList(),
    );
    if (persistenceService.getCustomGame() == null) {
      persistenceService.resetCustomGameToDefaultGame();
    }
    persistenceService.modifyConfigGameCardsAmount(
      cardType: state.selectedCardType,
      amount: state.cards
              .firstWhereOrNull(
                (final CustomizeModelCard card) =>
                    card.type == state.selectedCardType,
              )
              ?.amount ??
          0,
    );
  }

  @override
  void restoreDefault() {
    persistenceService.resetCustomGameToDefaultGame();
    navigationService.showSnackBar(
      LocaleKeys.config_view_restoredDefault.tr(),
    );
  }

  @override
  void pop() => navigationService.pop<void>();
}
