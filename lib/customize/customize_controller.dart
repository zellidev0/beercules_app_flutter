import 'dart:core';

import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/services/navigation_service/navigation_service.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomizeController extends StateNotifier<CustomizeModel> {
  final NavigationService _navigationService;
  final BeerculesCardProvider _beerculesCardsProvider;
  RemoveListener? listener;

  CustomizeController({
    required final NavigationService navigationService,
    required final BeerculesCardProvider beerculesCardsProvider,
    final CustomizeModel? model,
  })  : _navigationService = navigationService,
        _beerculesCardsProvider = beerculesCardsProvider,
        super(
          model ??
              CustomizeModel(
                selectedCardKey: null,
                configCards: <BeerculesCard>[],
              ),
        ) {
    listener = _beerculesCardsProvider
        .addListener((final BeerculesCardProviderModel s) {
      state = state.copyWith(
        selectedCardKey: state.selectedCardKey,
        configCards: s.configCards,
      );
    });
  }

  @override
  void dispose() {
    listener?.call();
    super.dispose();
  }

  void goBackToHome() => _navigationService.goBack();

  Future<void> showModal<T>({
    required final BuildContext context,
    required final String cardKey,
    required final Widget widget,
  }) async {
    state = state.copyWith(selectedCardKey: cardKey);
    await showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (final BuildContext innerContext) => widget,
    );
  }

  void modifyCardAmount() {
    _beerculesCardsProvider
      ..modifyConfigGameCardsAmount(
        cardKey: state.selectedCardKey ?? '',
        amount: ((_beerculesCardsProvider.state.configCards
                        .firstWhereOrNull(
                          (final BeerculesCard card) =>
                              card.key == state.selectedCardKey,
                        )
                        ?.amount ??
                    0) +
                1) %
            6,
      )
      ..setCurrentToConfig();
  }

  void restoreDefault({
    required final BuildContext context,
  }) {
    _beerculesCardsProvider.setConfigToDefault();
    _navigationService.showSnackBar('config_view.restoredDefault'.tr());
  }

  void pop() {
    _navigationService.pop<void>();
  }
}
