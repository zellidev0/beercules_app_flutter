import 'dart:async';
import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/utils.dart';
import 'package:beercules/services/persistence/implementation/database/database.dart';
import 'package:beercules/services/persistence/implementation/database/shared_prefs_database.dart';
import 'package:beercules/services/persistence/persistence_service_aggregator.dart';
import 'package:beercules/ui/screens/customize/services/customize_persistence_service.dart';

import 'package:beercules/ui/screens/game/services/game_persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'persistence_service.g.dart';

@Riverpod(keepAlive: true)
PersistenceServiceAggregator persistenceService(
  final PersistenceServiceRef ref,
) =>
    PersistenceService(
      database: ref.watch(sharedPrefsDatabaseProvider),
      defaultCards: <BeerculesCardType, int>{
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
      },
    );

class PersistenceService extends PersistenceServiceAggregator {
  final Map<BeerculesCardType, int> defaultBeerculesCards;

  final Database database;
  PersistenceService({
    required final Map<BeerculesCardType, int> defaultCards,
    required this.database,
  })  : defaultBeerculesCards = defaultCards,
        super();

  @override
  Future<void> resetActiveGameToDefaultGame() => database.saveActiveGame(
        mapToDatabaseCard(defaultBeerculesCards),
      );

  @override
  Future<void> resetCustomGameToDefaultGame() async => database.saveCustomCards(
        mapToDatabaseCard(defaultBeerculesCards),
      );

  List<DatabaseCard> mapToDatabaseCard(
    final Map<BeerculesCardType, int> cards,
  ) =>
      cards.entries
          .map(
            (final MapEntry<BeerculesCardType, int> entry) => DatabaseCard(
              type: entry.key,
              amount: entry.value,
            ),
          )
          .toList();

  @override
  Future<void> resetActiveGameToCustomGame() async {
    final List<DatabaseCard>? cards = database.readCustomCards();
    if (cards != null) {
      return database.saveActiveGame(cards);
    }
  }

  @override
  Future<void> decreaseActiveGameCardAmountByOne(
      final BeerculesCardType type) async {
    final List<DatabaseCard>? active = database.readActiveGame();
    if (active != null) {
      await database.saveActiveGame(
        active.map((final DatabaseCard card) {
          if (card.type == type) {
            return card.copyWith(amount: card.amount - 1);
          }
          return card;
        }).toList(),
      );
    }
  }

  @override
  Future<void> modifyConfigGameCardsAmount({
    required final BeerculesCardType? cardType,
    required final int amount,
  }) async {
    final List<DatabaseCard>? cards = database.readCustomCards();
    if (cards != null) {
      await database.saveCustomCards(
        cards.map((final DatabaseCard card) {
          if (card.type == cardType) {
            return card.copyWith(amount: amount);
          }
          return card;
        }).toList(),
      );
    }
  }

  @override
  GamePersistenceServiceGame? activeGame() =>
      convertToGamePersistenceServiceGame(
        database.readActiveGame(),
      );

  GamePersistenceServiceGame? convertToGamePersistenceServiceGame(
    final List<DatabaseCard>? cards,
  ) {
    final Map<BeerculesCardType, int>? game =
        cards?.fold<Map<BeerculesCardType, int>>(
      <BeerculesCardType, int>{},
      (final Map<BeerculesCardType, int> map, final DatabaseCard card) {
        map[card.type] = card.amount;
        return map;
      },
    );
    if (game == null) {
      return null;
    }
    return GamePersistenceServiceGame(
      cardToAmountMapping: game,
    );
  }

  @override
  GamePersistenceServiceGame? customGame() =>
      convertToGamePersistenceServiceGame(
        database.readCustomCards(),
      );

  @override
  GamePersistenceServiceGame defaultGame() => GamePersistenceServiceGame(
        cardToAmountMapping: defaultBeerculesCards,
      );

  @override
  List<CustomizePersistenceServiceModelCard>? getCustomGame() => database
      .readCustomCards()
      ?.map(
        (final DatabaseCard card) => CustomizePersistenceServiceModelCard(
          amount: card.amount,
          type: card.type,
        ),
      )
      .toList();

  @override
  List<CustomizePersistenceServiceModelCard> getDefaultGame() =>
      defaultBeerculesCards.entries
          .map(
            (final MapEntry<BeerculesCardType, int> entry) =>
                CustomizePersistenceServiceModelCard(
              amount: entry.value,
              type: entry.key,
            ),
          )
          .toList();
}
