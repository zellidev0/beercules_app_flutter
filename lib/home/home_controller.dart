import 'dart:core';

import 'package:beercules/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_model.dart';

class HomeController extends StateNotifier<HomeModel> {
  final NavigationService _navigationService;

  HomeController({
    required NavigationService navigationService,
    required HomeModel model,
  })  : _navigationService = navigationService,
        super(model);

  Future<void> goToGameView() async => _navigationService.navigateToNamed(
        uri: NavigationService.gameRouteUri,
        beamBackOnPop: true,
      );

  Future<void> goToRulesView() async => _navigationService.navigateToNamed(
        uri: NavigationService.rulesRouteUri,
        beamBackOnPop: true,
      );
}
