import 'dart:core';

import 'package:beercules/home/home_model.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/services/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<HomeModel> {
  final NavigationService _navigationService;

  HomeController({
    required final NavigationService navigationService,
    required final HomeModel model,
  })  : _navigationService = navigationService,
        super(model);

  Future<void> goToGameView() async => _navigationService.push(
        NavigationServiceRoutes.gameRouteUri,
      );

  Future<void> goToRulesView() async => _navigationService.push(
        NavigationServiceRoutes.rulesRouteUri,
      );

  Future<void> goToCustomizeView() async => _navigationService.push(
        NavigationServiceRoutes.customizeRouteUri,
      );
}
