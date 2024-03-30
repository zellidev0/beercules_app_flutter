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

class CustomizeControllerImplementation extends CustomizeController {
  StreamSubscription<List<CustomizePersistenceServiceModelCard>>?
      persistenceServiceSubscription;
  final CustomizeNavigationService navigationService;
  final CustomizePersistenceService persistenceService;

  @override
  CustomizeControllerImplementation({
    required this.navigationService,
    required this.persistenceService,
  }) : super(
          CustomizeModel(
            selectedCardType: null,
            configCards: <CustomizeModelCard>[],
          ),
        ) {
    persistenceServiceSubscription = persistenceService.configCardsChangeStream
        .listen(
            (final List<CustomizePersistenceServiceModelCard> updatedCards) {
      emit(
        state.copyWith(
          configCards: updatedCards
              .whereNot((final _) => _.type.isBasicRule())
              .map(
                (final CustomizePersistenceServiceModelCard card) =>
                    CustomizeModelCard(
                  type: card.type,
                  amount: card.amount,
                ),
              )
              .toList(),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    unawaited(persistenceServiceSubscription?.cancel());
    return super.close();
  }

  @override
  void goBackToHome() => navigationService.goBack();

  @override
  void showCard({
    required final BeerculesCardType cardType,
    required final Widget widget,
  }) {
    unawaited(navigationService.showPopup<void>(widget).run());
    emit(state.copyWith(selectedCardType: cardType));
  }

  @override
  void modifyCardAmount() {
    persistenceService
      ..modifyConfigGameCardsAmount(
        cardType: state.selectedCardType,
        amount: ((state.configCards
                        .firstWhereOrNull(
                          (final CustomizeModelCard card) =>
                              card.type == state.selectedCardType,
                        )
                        ?.amount ??
                    0) +
                1) %
            6,
      )
      ..resetToConfig();
  }

  @override
  void restoreDefault() {
    persistenceService.resetToDefaultCards();
    navigationService.showSnackBar(
      LocaleKeys.config_view_restoredDefault.tr(),
    );
  }

  @override
  void pop() => navigationService.pop<void>();
}