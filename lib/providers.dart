import 'package:beercules/common.dart';
import 'package:beercules/customize/customize_controller.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/game/game_controller.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/shared/beercules_card_model.dart';
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
  final StateNotifierProvider<BeerculesCardProvider, BeerculesCardProviderModel>
      beerculesCardProvider =
      StateNotifierProvider<BeerculesCardProvider, BeerculesCardProviderModel>(
    (StateNotifierProviderRef<BeerculesCardProvider, BeerculesCardProviderModel>
            ref) =>
        BeerculesCardProvider(
      beerculesCards: {
        "ABSTIMMUNG": 0,
        "ALLE_FUER_EINEN": 0,
        "AUFZAEHLUNG": 0,
        "BEER_LOVE": 0,
        "BIERGOTT": 0,
        "DECKEL_DRAUF": 0,
        "DREI_GESCHENKE_VON_HERZEN": 0,
        "EIN_GESCHENK_VON_HERZEN": 0,
        "EISPRINZESSIN": 0,
        "FILMRISS": 0,
        "FRAGENKOENIG": 0,
        "HAENDE_HOCH": 0,
        "ICH_HAB_NOCH_NIE": 0,
        "ICH_PACKE_MEINEN_KOFFER": 0,
        "KETTENREAKTION": 0,
        "KNUTSCHKARTE": 0,
        "LINKS": 0,
        "MENS_HEALTH": 0,
        "OHREN_SPITZEN": 2,
        "OPFERGLAS": 3,
        "RECHTS": 0,
        "REIMSCHWEIN": 0,
        "RICHTUNGSWECHSEL": 0,
        "SCHERE_STEIN_PAAR_BIER": 0,
        "SING_NO_SONG": 0,
        "SPIEGLEIN_SPIEGLEIN": 0,
        "TAUSCHRAUSCH": 0,
        "TRINK_BUDDY": 0,
        "WOMENS_HEALTH": 0,
        "_1_2_3_BIER": 0,
        "BASIC_RULE_1": 0,
        "BASIC_RULE_2": 0,
        "BASIC_RULE_3": 0,
      }
          .entries
          .map(
            (entry) => BeerculesCard(
              key: entry.key,
              amount: entry.value,
              isBasicRule: entry.key.contains("BASIC_RULE"),
              isVictimGlass: entry.key.contains("OPFERGLAS"),
            ),
          )
          .toList(),
    ),
  );

  final StateNotifierProvider<CustomizeController, CustomizeModel>
      customizeController =
      StateNotifierProvider<CustomizeController, CustomizeModel>(
    (StateNotifierProviderRef<CustomizeController, CustomizeModel> ref) =>
        CustomizeController(
      navigationService: ref.read(
        providers.navigationServiceProvider,
      ),
      beerculesCardsProvider:
          ref.read(providers.beerculesCardProvider.notifier),
    ),
  );

  final AutoDisposeStateNotifierProvider<GameController, GameModel>
      gameController =
      AutoDisposeStateNotifierProvider<GameController, GameModel>(
    (AutoDisposeStateNotifierProviderRef<GameController, GameModel> ref) =>
        GameController(
      navigationService: ref.read(providers.navigationServiceProvider),
      beerculesCardsProvider:
          ref.read(providers.beerculesCardProvider.notifier),
    ),
  );
}
