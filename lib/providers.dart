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
      model: const GameModel(cards: [
        "ABSTIMMUNG",
        "ALLE_FUER_EINEN",
        "AUFZAEHLUNG",
        "BEER_LOVE",
        "BIERGOTT",
        "DECKEL_DRAUF",
        "DREI_GESCHENKE_VON_HERZEN",
        "EIN_GESCHENK_VON_HERZEN",
        "EISPRINZESSIN",
        "FILMRISS",
        "FRAGENKOENIG",
        "HAENDE_HOCH",
        "ICH_HAB_NOCH_NIE",
        "ICH_PACKE_MEINEN_KOFFER_",
        "KETTENREAK",
        "KNUTSCHKARTE",
        "LINKS",
        "MENS_HEALTH",
        "OHREN_SPITZEN",
        "OPFERGLAS",
        "RECHTS",
        "REIMSCHWEIN",
        "RICHTUNGSWECHSEL",
        "SCHERE_STEIN_PAAR_BIER",
        "SING_NO_SONG",
        "SPIEGLEIN_SPIEGLEIN",
        "TAUSCHRAUSCH",
        "TRINK_BUDDY",
        "WOMENS_HEALTH",
        "_1_2_3_BIER",
      ]),
    ),
  );
}
