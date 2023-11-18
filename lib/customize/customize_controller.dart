import 'dart:core';

import 'package:beercules/common.dart';
import 'package:beercules/services/navigation_service.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'customize_model.dart';

class CustomizeController extends StateNotifier<CustomizeModel> {
  final NavigationService _navigationService;
  final BeerculesCardProvider _beerculesCardsProvider;
  RemoveListener? listener;

  CustomizeController({
    required NavigationService navigationService,
    CustomizeModel? model,
    required BeerculesCardProvider beerculesCardsProvider,
  })  : _navigationService = navigationService,
        _beerculesCardsProvider = beerculesCardsProvider,
        super(
          model ??
              CustomizeModel(
                selectedCardKey: null,
                configCards: [],
              ),
        ) {
    listener = _beerculesCardsProvider.addListener((s) {
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

  showModal({
    required BuildContext context,
    required String cardKey,
    required Widget widget,
  }) {
    state = state.copyWith(selectedCardKey: cardKey);
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext innerContext) => widget,
    );
  }

  void modifyCardAmount() {
    _beerculesCardsProvider.modifyConfigGameCardsAmount(
      cardKey: state.selectedCardKey ?? "",
      amount: ((_beerculesCardsProvider.state.configCards
                      .firstWhereOrNull(
                          (card) => card.key == state.selectedCardKey)
                      ?.amount ??
                  0) +
              1) %
          6,
    );
    _beerculesCardsProvider.setCurrentToConfig();
  }

  void restoreDefault({
    required BuildContext context,
  }) {
    _beerculesCardsProvider.setConfigToDefault();
    showSnackbar(context: context, message: 'config_view.restoredDefault'.tr());
  }

  void pop() {
    _navigationService.pop();
  }
}
