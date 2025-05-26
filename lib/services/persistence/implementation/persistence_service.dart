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

List<PersistenceServiceModelConfigCard> initialCards =
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
          BeerculesCardType.liveLaughLaugh: 1,
          BeerculesCardType.vollGeilGeilVoll: 1,
          BeerculesCardType.heyDu: 1,
          BeerculesCardType.klaus: 1,
          BeerculesCardType.medusa: 1,
          BeerculesCardType.bier123: 1,
          BeerculesCardType.doubleTime: 2,
          // BeerculesCardType.adsAdsAds: 2,
          BeerculesCardType.basicRule1: 1,
          BeerculesCardType.basicRule2: 1,
          BeerculesCardType.basicRule3: 1,
        }.entries
        .map(
          (MapEntry<BeerculesCardType, int> entry) =>
              PersistenceServiceModelConfigCard(
                type: entry.key,
                amount: entry.value,
              ),
        )
        .toList();

class PersistenceService extends PersistenceServiceAggregator {
  List<ConfigCard> defaultBeerculesCards;
  BehaviorSubject<List<CustomizePersistenceServiceModelCard>>
  configCardsChangeSubject;
  BehaviorSubject<List<GamePersistenceServiceCard>> currentCardsChangeSubject;

  PersistenceService({required List<ConfigCard> initialCards})
    : defaultBeerculesCards = initialCards,
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
  void onChange(Change<PersistenceServiceModel> change) {
    super.onChange(change);
    emitStateChange(state: change.nextState);
  }

  static List<ConfigCard> shuffleCards({required List<ConfigCard> cards}) =>
      <ConfigCard>[
        ...shuffle(
          Random().nextInt(10),
          cards.where((it) => !it.type.isBasicRule()).toList(),
        ),
        ...cards.where((it) => it.type.isBasicRule()),
      ];

  void emitStateChange({required PersistenceServiceModel state}) {
    configCardsChangeSubject.add(
      state.configCards
          .map(
            (ConfigCard card) => CustomizePersistenceServiceModelCard(
              type: card.type,
              amount: card.amount,
            ),
          )
          .toList(),
    );
    currentCardsChangeSubject.add(
      state.currentGameCards
          .map(
            (ActiveGameCard card) => GamePersistenceServiceCard(
              id: card.id,
              type: card.type,
              wasPlayed: card.wasPlayed,
            ),
          )
          .toList(),
    );
  }

  static List<ActiveGameCard> _initCurrentCards(List<ConfigCard> cards) {
    var newCards =
        cards
            .map(
              (ConfigCard card) =>
                  List<({ConfigCard card, int index})>.generate(
                    card.amount,
                    (int index) => (index: index, card: card),
                  ),
            )
            .expand((it) => it)
            .map(
              (({ConfigCard card, int index}) card) => ActiveGameCard(
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
            .where((ActiveGameCard card) => !card.type.isBasicRule())
            .toList(),
      ),
      ...newCards.where((ActiveGameCard card) => card.type.isBasicRule()),
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
    emit(state.copyWith(configCards: defaultBeerculesCards));
  }

  @override
  void resetToConfig() {
    emit(
      state.copyWith(currentGameCards: _initCurrentCards(state.configCards)),
    );
  }

  @override
  void decreaseCurrentGameCardsAmount({required String cardId}) {
    emit(
      state.copyWith(
        currentGameCards:
            state.currentGameCards
                .map(
                  (ActiveGameCard card) =>
                      card.id == cardId ? card.copyWith(wasPlayed: true) : card,
                )
                .toList(),
      ),
    );
  }

  @override
  void modifyConfigGameCardsAmount({
    required BeerculesCardType? cardType,
    required int amount,
  }) {
    emit(
      state.copyWith(
        configCards:
            state.configCards
                .map(
                  (ConfigCard card) =>
                      card.type == cardType
                          ? card.copyWith(amount: amount)
                          : card,
                )
                .toList(),
      ),
    );
  }

  @override
  bool currentGameHasBeenStarted() =>
      state.currentGameCards.where((it) => it.wasPlayed).isEmpty;

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
