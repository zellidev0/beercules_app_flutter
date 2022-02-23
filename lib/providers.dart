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

  final StateNotifierProvider<GameController, GameModel> gameController =
      StateNotifierProvider<GameController, GameModel>(
    (StateNotifierProviderRef<GameController, GameModel> ref) => GameController(
      navigationService: ref.read(
        providers.navigationServiceProvider,
      ),
      model: GameModel(cards: {
        "ABSTIMMUNG": 2,
        "ALLE_FUER_EINEN": 1,
        "AUFZAEHLUNG": 3,
        "BEER_LOVE": 1,
        "BIERGOTT": 5,
        "DECKEL_DRAUF": 1,
        "DREI_GESCHENKE_VON_HERZEN": 1,
        "EIN_GESCHENK_VON_HERZEN": 1,
        "EISPRINZESSIN": 1,
        "FILMRISS": 1,
        "FRAGENKOENIG": 1,
        "HAENDE_HOCH": 1,
        "ICH_HAB_NOCH_NIE": 1,
        "ICH_PACKE_MEINEN_KOFFER_": 1,
        "KETTENREAK": 1,
        "KNUTSCHKARTE": 1,
        "LINKS": 1,
        "MENS_HEALTH": 1,
        "OHREN_SPITZEN": 1,
        "OPFERGLAS": 1,
        "RECHTS": 1,
        "REIMSCHWEIN": 1,
        "RICHTUNGSWECHSEL": 1,
        "SCHERE_STEIN_PAAR_BIER": 1,
        "SING_NO_SONG": 1,
        "SPIEGLEIN_SPIEGLEIN": 1,
        "TAUSCHRAUSCH": 1,
        "TRINK_BUDDY": 1,
        "WOMENS_HEALTH": 1,
        "_1_2_3_BIER": 1,
      }),
    ),
  );
}
