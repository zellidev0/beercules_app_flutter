import 'dart:async';

import 'package:beercules/services/navigation_service/navigation_service_routes.dart';
import 'package:beercules/ui/screens/home/home_model.dart';
import 'package:beercules/ui/screens/home/home_view.dart';
import 'package:beercules/ui/screens/home/services/home_ad_service.dart';
import 'package:beercules/ui/screens/home/services/home_navigation_service.dart';
import 'package:beercules/ui/screens/home/widgets/legal_notice.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeControllerImplementation extends _$HomeControllerImplementation
    implements HomeController {
  @override
  HomeModel build({
    required final HomeNavigationService navigationService,
    required final HomeAdService adService,
  }) =>
      HomeModel();

  @override
  void goToGameView() => navigationService.push(
        NavigationServiceRoutes.gameRouteUri,
      );

  @override
  void goToRulesView() => navigationService.push(
        NavigationServiceRoutes.rulesRouteUri,
      );

  @override
  void goToCustomizeView() => navigationService.push(
        NavigationServiceRoutes.customizeRouteUri,
      );

  @override
  void showModalLegalNotice() =>
      unawaited(navigationService.showModal<void>(const LegalNotice()).run());

  @override
  Future<void> resetTrackingConsent() async => adService.resetTrackingConsent();
}
