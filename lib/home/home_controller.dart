import 'dart:async';

import 'package:beercules/home/home_model.dart';
import 'package:beercules/home/home_view.dart';
import 'package:beercules/home/services/home_navigation_service.dart';
import 'package:beercules/services/navigation_service/navigation_service_routes.dart';
import 'package:flutter/widgets.dart';

class HomeControllerImplementation extends HomeController {
  final HomeNavigationService _navigationService;

  HomeControllerImplementation({
    required final HomeNavigationService navigationService,
    required final HomeModel model,
  })  : _navigationService = navigationService,
        super(model);

  @override
  void goToGameView() => _navigationService.push(
        NavigationServiceRoutes.gameRouteUri,
      );

  @override
  void goToRulesView() => _navigationService.push(
        NavigationServiceRoutes.rulesRouteUri,
      );

  @override
  void goToCustomizeView() => _navigationService.push(
        NavigationServiceRoutes.customizeRouteUri,
      );

  @override
  void showModalLegalNotice({required final Widget widget}) =>
      unawaited(_navigationService.showModal<void>(widget).run());
}
