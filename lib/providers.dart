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
        "ABSTIMMUNG": 3,
        "ALLE_FUER_EINEN": 1,
        "AUFZAEHLUNG": 3,
        "BEER_LOVE": 2,
        "BIERGOTT": 3,
        "DECKEL_DRAUF": 2,
        "DREI_GESCHENKE_VON_HERZEN": 1,
        "EIN_GESCHENK_VON_HERZEN": 1,
        "EISPRINZESSIN": 2,
        "FILMRISS": 2,
        "FRAGENKOENIG": 4,
        "HAENDE_HOCH": 2,
        "ICH_HAB_NOCH_NIE": 2,
        "ICH_PACKE_MEINEN_KOFFER": 1,
        "KETTENREAKTION": 1,
        "KNUTSCHKARTE": 1,
        "LINKS": 1,
        "MENS_HEALTH": 1,
        "OHREN_SPITZEN": 2,
        "OPFERGLAS": 4,
        "RECHTS": 1,
        "REIMSCHWEIN": 2,
        "RICHTUNGSWECHSEL": 2,
        "SCHERE_STEIN_PAAR_BIER": 2,
        "SING_NO_SONG": 1,
        "SPIEGLEIN_SPIEGLEIN": 0,
        "TAUSCHRAUSCH": 1,
        "TRINK_BUDDY": 3,
        "WOMENS_HEALTH": 1,
        "_1_2_3_BIER": 1,
        "BASIC_RULE_1": 1,
        "BASIC_RULE_2": 1,
        "BASIC_RULE_3": 1,
      }
          .entries
          .map(
            (entry) => BeerculesCard(
              key: entry.key,
              amount: entry.value,
              isBasicRule: entry.key.contains("BASIC_RULE"),
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
