import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/customize/customize_controller.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/game/game_controller.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/go_router.dart';
import 'package:beercules/home/home_controller.dart';
import 'package:beercules/home/home_model.dart';
import 'package:beercules/home/home_view.dart';
import 'package:beercules/services/navigation_service/implementation/go_router_navigation_service.dart';
import 'package:beercules/services/navigation_service/navigation_service_aggregator.dart';
import 'package:beercules/services/persistence/implementation/persistence_service.dart';
import 'package:beercules/services/persistence/persistence_service_aggregator.dart';
import 'package:beercules/services/persistence/persistence_service_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

final Providers providers = Providers();

@riverpod
NavigationServiceAggregator goRouterNavigationService(
  final GoRouterNavigationServiceRef ref,
) =>
    GoRouterNavigationService(goRouter: ref.watch(goRouterProvider));

class Providers {
  final StateNotifierProvider<HomeController, HomeModel> homeController =
      StateNotifierProvider<HomeController, HomeModel>(
    (final StateNotifierProviderRef<HomeController, HomeModel> ref) =>
        HomeControllerImplementation(
      navigationService: ref.read(goRouterNavigationServiceProvider),
      model: HomeModel(),
    ),
  );
  final StateNotifierProvider<PersistenceServiceAggregator,
          PersistenceServiceModel> beerculesCardProvider =
      StateNotifierProvider<PersistenceServiceAggregator,
          PersistenceServiceModel>(
    (
      final StateNotifierProviderRef<PersistenceServiceAggregator,
              PersistenceServiceModel>
          ref,
    ) =>
        PersistenceService(
      beerculesCards: <BeerculesCardType, int>{
        BeerculesCardType.abstimmung: 3,
        BeerculesCardType.alleFuerEinen: 1,
        BeerculesCardType.aufzaehlung: 3,
        BeerculesCardType.beerLove: 2,
        BeerculesCardType.biergott: 3,
        BeerculesCardType.deckelDrauf: 2,
        BeerculesCardType.dreiGeschenkeVonHerzen: 1,
        BeerculesCardType.einGeschenkVonHerzen: 1,
        BeerculesCardType.eisprinzessin: 2,
        BeerculesCardType.filmriss: 2,
        BeerculesCardType.fragenkoenig: 4,
        BeerculesCardType.haendeHoch: 2,
        BeerculesCardType.ichHabNochNie: 2,
        BeerculesCardType.ichPackeMeinenKoffer: 1,
        BeerculesCardType.kettenreaktion: 1,
        BeerculesCardType.knutschkarte: 1,
        BeerculesCardType.links: 1,
        BeerculesCardType.mensHealth: 1,
        BeerculesCardType.ohrenSpitzen: 2,
        BeerculesCardType.opferglas: 4,
        BeerculesCardType.rechts: 1,
        BeerculesCardType.reimschwein: 2,
        BeerculesCardType.richtungswechsel: 2,
        BeerculesCardType.schereSteinPaarBier: 2,
        BeerculesCardType.singNoSong: 1,
        BeerculesCardType.spiegelSpiegel: 0,
        BeerculesCardType.tauschrausch: 1,
        BeerculesCardType.trinkBuddy: 3,
        BeerculesCardType.womensHealth: 1,
        BeerculesCardType.bier123: 1,
        BeerculesCardType.basicRule1: 1,
        BeerculesCardType.basicRule2: 1,
        BeerculesCardType.basicRule3: 1,
      }
          .entries
          .map(
            (final MapEntry<BeerculesCardType, int> entry) =>
                PersistenceServiceModelConfigCard(
              type: entry.key,
              amount: entry.value,
            ),
          )
          .toList(),
    ),
  );

  final StateNotifierProvider<CustomizeControllerImplementation, CustomizeModel>
      customizeController =
      StateNotifierProvider<CustomizeControllerImplementation, CustomizeModel>(
    (final StateNotifierProviderRef<CustomizeControllerImplementation,
                CustomizeModel>
            ref) =>
        CustomizeControllerImplementation(
      navigationService: ref.read(goRouterNavigationServiceProvider),
      persistenceService: ref.read(providers.beerculesCardProvider.notifier),
    ),
  );

  final AutoDisposeStateNotifierProvider<GameControllerImplementation,
          GameModel> gameController =
      AutoDisposeStateNotifierProvider<GameControllerImplementation, GameModel>(
    (
      final AutoDisposeStateNotifierProviderRef<GameControllerImplementation,
              GameModel>
          ref,
    ) =>
        GameControllerImplementation(
      navigationService: ref.read(goRouterNavigationServiceProvider),
      persistenceService: ref.read(providers.beerculesCardProvider.notifier),
    ),
  );
}
