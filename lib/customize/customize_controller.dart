import 'dart:async';
import 'dart:core';
import 'package:beercules/common/beercules_card_model.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/services/navigation_service/navigation_service.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomizeController extends StateNotifier<CustomizeModel> {
  final NavigationService _navigationService;
  final BeerculesCardProvider _beerculesCardsProvider;
  RemoveListener? removeListener;

  CustomizeController({
    required final NavigationService navigationService,
    required final BeerculesCardProvider beerculesCardsProvider,
  })  : _navigationService = navigationService,
        _beerculesCardsProvider = beerculesCardsProvider,
        super(
          CustomizeModel(
            selectedCardType: null,
            configCards: <BeerculesCard>[],
          ),
        ) {
    removeListener = _beerculesCardsProvider
        .addListener((final BeerculesCardProviderModel model) {
      state = state.copyWith(
        selectedCardType: state.selectedCardType,
        configCards:
            model.configCards.whereNot((final _) => _.isBasicRule).toList(),
      );
    });
  }

  @override
  void dispose() {
    removeListener?.call();
    super.dispose();
  }

  void goBackToHome() => _navigationService.goBack();

  void showCard({
    required final BeerculesCardType cardType,
    required final Widget widget,
  }) {
    unawaited(_navigationService.showPopup<void>(widget).run());
    state = state.copyWith(selectedCardType: cardType);
  }

  void modifyCardAmount() {
    _beerculesCardsProvider
      ..modifyConfigGameCardsAmount(
        cardType: state.selectedCardType,
        amount: ((_beerculesCardsProvider.state.configCards
                        .firstWhereOrNull(
                          (final BeerculesCard card) =>
                              card.type == state.selectedCardType,
                        )
                        ?.amount ??
                    0) +
                1) %
            6,
      )
      ..setCurrentToConfig();
  }

  void restoreDefault() {
    _beerculesCardsProvider.resetToDefaultCards();
    _navigationService.showSnackBar(
      LocaleKeys.config_view_restoredDefault.tr(),
    );
  }

  void pop() => _navigationService.pop<void>();
}
