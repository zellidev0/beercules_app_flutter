import 'dart:core';

import 'package:beercules/common.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'customize_model.dart';

class CustomizeController extends StateNotifier<CustomizeModel> {
  final NavigationService _navigationService;
  final BeerculesCardProvider _beerculesCardsProvider;

  CustomizeController({
    required NavigationService navigationService,
    required CustomizeModel model,
    required BeerculesCardProvider beerculesCardsProvider,
  })  : _navigationService = navigationService,
        _beerculesCardsProvider = beerculesCardsProvider,
        super(model);

  List<BeerculesCard> get beerculesCards => _beerculesCardsProvider.state;

  Future<void> goToGameView() async => _navigationService.navigateToNamed(
        uri: NavigationService.gameRouteUri,
        beamBackOnPop: true,
      );

  Future<void> goToRulesView() async => _navigationService.navigateToNamed(
        uri: NavigationService.rulesRouteUri,
        beamBackOnPop: true,
      );

  void goBackToHome() async => await _navigationService.navigateToNamed(
        uri: NavigationService.homeRouteUri,
        beamBackOnPop: false,
      );

  showModal({
    required BuildContext context,
    required Widget widget,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext innerContext) => widget,
    );
  }

  void modifyCardAmount({required BeerculesCard card}) {
    _beerculesCardsProvider.state = _beerculesCardsProvider.state
        .map((c) => c.key == card.key ? c.copyWith(amount: (c.amount + 1)) : c)
        .toList();
  }

  void restoreDefault() {
    _beerculesCardsProvider.restoreDefault();
  }

  void pop() {
    _navigationService.pop();
  }

}
