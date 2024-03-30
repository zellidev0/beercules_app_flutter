import 'dart:async';
import 'dart:math';

import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/utils.dart';
import 'package:beercules/services/persistence/persistence_service_aggregator.dart';
import 'package:beercules/services/persistence/persistence_service_model.dart';
import 'package:beercules/ui/screens/customize/services/customize_persistence_service.dart';
import 'package:beercules/ui/screens/game/services/game_persistence_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

typedef ConfigCard = PersistenceServiceModelConfigCard;
typedef ActiveGameCard = PersistenceServiceModelActiveGameCard;

final List<PersistenceServiceModelConfigCard> initialCards =
    <BeerculesCardType, int>{
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
        .toList();

class PersistenceService extends PersistenceServiceAggregator {
  final List<ConfigCard> defaultBeerculesCards;
  final BehaviorSubject<List<CustomizePersistenceServiceModelCard>>
      configCardsChangeSubject;
  final BehaviorSubject<List<GamePersistenceServiceCard>>
      currentCardsChangeSubject;

  PersistenceService({
    required final List<ConfigCard> initialCards,
  })  : defaultBeerculesCards = initialCards,
        configCardsChangeSubject =
            BehaviorSubject<List<CustomizePersistenceServiceModelCard>>(),
        currentCardsChangeSubject =
            BehaviorSubject<List<GamePersistenceServiceCard>>(),
        super(
          PersistenceServiceModel(
            configCards: initialCards,
            currentGameCards: _initCurrentCards(initialCards),
          ),
        ) {
    emitStateChange(state: state);
  }

  @override
  void onChange(final Change<PersistenceServiceModel> change) {
    super.onChange(change);
    emitStateChange(state: change.nextState);
  }

  static List<ConfigCard> shuffleCards({
    required final List<ConfigCard> cards,
  }) =>
      <ConfigCard>[
        ...shuffle(
          Random().nextInt(10),
          cards.where((final _) => !_.type.isBasicRule()).toList(),
        ),
        ...cards.where((final _) => _.type.isBasicRule()),
      ];

  void emitStateChange({required final PersistenceServiceModel state}) {
    configCardsChangeSubject.add(
      state.configCards
          .map(
            (final ConfigCard card) => CustomizePersistenceServiceModelCard(
              type: card.type,
              amount: card.amount,
            ),
          )
          .toList(),
    );
    currentCardsChangeSubject.add(
      state.currentGameCards
          .map(
            (final ActiveGameCard card) => GamePersistenceServiceCard(
              id: card.id,
              type: card.type,
              wasPlayed: card.wasPlayed,
            ),
          )
          .toList(),
    );
  }

  static List<ActiveGameCard> _initCurrentCards(
    final List<ConfigCard> cards,
  ) {
    final List<ActiveGameCard> newCards = cards
        .map(
          (final ConfigCard card) =>
              List<({ConfigCard card, int index})>.generate(
            card.amount,
            (final int index) => (index: index, card: card),
          ),
        )
        .expand((final _) => _)
        .map(
          (final ({ConfigCard card, int index}) card) => ActiveGameCard(
            type: card.card.type,
            wasPlayed: false,
            id: card.card.type.toString() + card.index.toString(),
          ),
        )
        .toList();
    return <ActiveGameCard>[
      ...shuffle(
        Random().nextInt(100),
        newCards
            .where((final ActiveGameCard card) => !card.type.isBasicRule())
            .toList(),
      ),
      ...newCards.where((final ActiveGameCard card) => card.type.isBasicRule()),
    ];
  }

  @override
  void setCurrentToDefault() {
    emit(
      state.copyWith(
        currentGameCards: _initCurrentCards(defaultBeerculesCards),
      ),
    );
  }

  @override
  void resetToDefaultCards() {
    emit(
      state.copyWith(
        configCards: defaultBeerculesCards,
      ),
    );
  }

  @override
  void resetToConfig() {
    emit(
      state.copyWith(
        currentGameCards: _initCurrentCards(state.configCards),
      ),
    );
  }

  @override
  void decreaseCurrentGameCardsAmount({required final String cardId}) {
    emit(
      state.copyWith(
        currentGameCards: state.currentGameCards
            .map(
              (final ActiveGameCard card) =>
                  card.id == cardId ? card.copyWith(wasPlayed: true) : card,
            )
            .toList(),
      ),
    );
  }

  @override
  void modifyConfigGameCardsAmount({
    required final BeerculesCardType? cardType,
    required final int amount,
  }) {
    emit(
      state.copyWith(
        configCards: state.configCards
            .map(
              (final ConfigCard card) =>
                  card.type == cardType ? card.copyWith(amount: amount) : card,
            )
            .toList(),
      ),
    );
  }

  @override
  bool currentGameHasBeenStarted() =>
      state.currentGameCards.where((final _) => _.wasPlayed).isEmpty;

  @override
  bool configDiffersFromDefault() =>
      !listEquals(state.configCards, defaultBeerculesCards);

  @override
  Stream<List<CustomizePersistenceServiceModelCard>>
      get configCardsChangeStream => configCardsChangeSubject.stream;

  @override
  Stream<List<GamePersistenceServiceCard>> get currentCardsChangeStream =>
      currentCardsChangeSubject.stream;
}
