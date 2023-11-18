import 'dart:core';

import 'package:beercules/navigation_service.dart';
import 'package:beercules/services/navigation_service.dart';
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
        NavigationServiceRoutes.gameRouteUri,
      );

  Future<void> goToRulesView() async => _navigationService.navigateToNamed(
        NavigationServiceRoutes.rulesRouteUri,
      );

  Future<void> goToCustomizeView() async => _navigationService.navigateToNamed(
        NavigationServiceRoutes.customizeRouteUri,
      );
}
