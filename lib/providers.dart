import 'package:riverpod/riverpod.dart';

import 'home/home_controller.dart';
import 'home/home_model.dart';
import 'navigation_service.dart';

final Providers providers = Providers();

class Providers {
  final Provider<NavigationService> navigationServiceProvider =
      _navigationServiceProvider();

  static Provider<NavigationService> _navigationServiceProvider() =>
      Provider<NavigationService>(
        (ProviderRef<NavigationService> ref) => NavigationService(),
      );

  final StateNotifierProvider<HomeController, HomeModel> homeController =
      StateNotifierProvider<HomeController, HomeModel>(
    (StateNotifierProviderRef<HomeController, HomeModel> ref) => HomeController(
      navigationService: ref.read(
        providers.navigationServiceProvider,
      ),
      model: HomeModel(),
    ),
  );
}
