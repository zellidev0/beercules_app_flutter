import 'package:beercules_flutter/game/game_controller.dart';
import 'package:beercules_flutter/game/game_model.dart';
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

  final AutoDisposeStateNotifierProvider<GameController, GameModel>
      gameController =
      StateNotifierProvider.autoDispose<GameController, GameModel>(
    (AutoDisposeStateNotifierProviderRef<GameController, GameModel> ref) =>
        GameController(
      navigationService: ref.read(
        providers.navigationServiceProvider,
      ),
    ),
  );
}
