import 'dart:core';

import 'package:beercules/navigation_service.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'customize_model.dart';

class CustomizeController extends StateNotifier<CustomizeModel> {
  final NavigationService _navigationService;
  final List<BeerculesCard> _beerculesCards;

  CustomizeController({
    required NavigationService navigationService,
    required CustomizeModel model,
    required List<BeerculesCard> beerculesCards,
  })  : _navigationService = navigationService,
        _beerculesCards = beerculesCards,
        super(model);

  List<BeerculesCard> get beerculesCards => _beerculesCards;

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

}
