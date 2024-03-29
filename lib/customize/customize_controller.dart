import 'dart:async';
import 'dart:core';
import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/customize/customize_controller_interface.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/customize/services/customize_navigation_service.dart';
import 'package:beercules/customize/services/customize_persistence_service.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomizeController extends CustomizeControllerInterface {
  final CustomizeNavigationService _navigationService;
  final CustomizePersistenceService _persistenceService;
  StreamSubscription<List<CustomizePersistenceServiceModelCard>>?
      persistenceServiceSubscription;

  CustomizeController({
    required final CustomizeNavigationService navigationService,
    required final CustomizePersistenceService persistenceService,
  })  : _navigationService = navigationService,
        _persistenceService = persistenceService,
        super(
          CustomizeModel(
            selectedCardType: null,
            configCards: <CustomizeModelCard>[],
          ),
        ) {
    persistenceServiceSubscription = _persistenceService.configCardsChangeStream
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
  }

  @override
  void dispose() {
    unawaited(persistenceServiceSubscription?.cancel());
    super.dispose();
  }

  @override
  void goBackToHome() => _navigationService.goBack();

  @override
  void showCard({
    required final BeerculesCardType cardType,
    required final Widget widget,
  }) {
    unawaited(_navigationService.showPopup<void>(widget).run());
    state = state.copyWith(selectedCardType: cardType);
  }

  @override
  void modifyCardAmount() {
    _persistenceService
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
    _persistenceService.resetToDefaultCards();
    _navigationService.showSnackBar(
      LocaleKeys.config_view_restoredDefault.tr(),
    );
  }

  @override
  void pop() => _navigationService.pop<void>();
}
