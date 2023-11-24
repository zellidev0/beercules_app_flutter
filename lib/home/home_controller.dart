import 'dart:async';

import 'package:beercules/home/home_model.dart';
import 'package:beercules/services/navigation_service/navigation_service.dart';
import 'package:beercules/services/navigation_service/navigation_service_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<HomeModel> {
  final NavigationService _navigationService;

  HomeController({
    required final NavigationService navigationService,
    required final HomeModel model,
  })  : _navigationService = navigationService,
        super(model);

  void goToGameView() => _navigationService.push(
        NavigationServiceRoutes.gameRouteUri,
      );

  void goToRulesView() => _navigationService.push(
        NavigationServiceRoutes.rulesRouteUri,
      );

  void goToCustomizeView() => _navigationService.push(
        NavigationServiceRoutes.customizeRouteUri,
      );

  void showModalLegalNotice({required final Widget widget}) =>
      unawaited(_navigationService.showModal<void>(widget).run());
}
