import 'dart:async';
import 'dart:math';

import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/utils.dart';
import 'package:beercules/customize/services/customize_persistence_service.dart';
import 'package:beercules/game/services/game_persistence_service.dart';
import 'package:beercules/services/persistence/persistence_service_aggregator.dart';
import 'package:beercules/services/persistence/persistence_service_model.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

typedef ConfigCard = PersistenceServiceModelConfigCard;
typedef ActiveGameCard = PersistenceServiceModelActiveGameCard;

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
    emitStateChange();
    addListener((final _) => emitStateChange());
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

  void emitStateChange() {
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
    state = state.copyWith(
      currentGameCards: _initCurrentCards(defaultBeerculesCards),
    );
  }

  @override
  void resetToDefaultCards() {
    state = state.copyWith(
      configCards: defaultBeerculesCards,
    );
  }

  @override
  void resetToConfig() {
    state = state.copyWith(
      currentGameCards: _initCurrentCards(state.configCards),
    );
  }

  @override
  void decreaseCurrentGameCardsAmount({required final String cardId}) {
    state = state.copyWith(
      currentGameCards: state.currentGameCards
          .map(
            (final ActiveGameCard card) =>
                card.id == cardId ? card.copyWith(wasPlayed: true) : card,
          )
          .toList(),
    );
  }

  @override
  void modifyConfigGameCardsAmount({
    required final BeerculesCardType? cardType,
    required final int amount,
  }) {
    state = state.copyWith(
      configCards: state.configCards
          .map(
            (final ConfigCard card) =>
                card.type == cardType ? card.copyWith(amount: amount) : card,
          )
          .toList(),
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
