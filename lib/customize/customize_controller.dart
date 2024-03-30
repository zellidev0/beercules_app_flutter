import 'dart:async';
import 'dart:core';
import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/customize/customize_view.dart';
import 'package:beercules/customize/services/customize_navigation_service.dart';
import 'package:beercules/customize/services/customize_persistence_service.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customize_controller.g.dart';

@riverpod
class CustomizeControllerImplementation
    extends _$CustomizeControllerImplementation implements CustomizeController {
  StreamSubscription<List<CustomizePersistenceServiceModelCard>>?
      persistenceServiceSubscription;

  @override
  CustomizeModel build({
    required final CustomizeNavigationService navigationService,
    required final CustomizePersistenceService persistenceService,
  }) {
    persistenceServiceSubscription = persistenceService.configCardsChangeStream
        .listen(
            (final List<CustomizePersistenceServiceModelCard> updatedCards) {
      state = state.copyWith(
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
      );
    });
    ref.onDispose(() {
      unawaited(persistenceServiceSubscription?.cancel());
    });
    return CustomizeModel(
      selectedCardType: null,
      configCards: <CustomizeModelCard>[],
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
