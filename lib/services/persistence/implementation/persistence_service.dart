import 'dart:async';

import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/customize/services/customize_persistence_service.dart';
import 'package:beercules/game/services/game_persistence_service.dart';
import 'package:beercules/services/persistence/persistence_service_aggregator.dart';
import 'package:beercules/services/persistence/persistence_service_model.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class PersistenceService extends PersistenceServiceAggregator {
  final List<PersistenceServiceModelConfigCard> defaultBeerculesCards;
  final BehaviorSubject<List<CustomizePersistenceServiceModelCard>>
      configCardsChangeSubject;
  final BehaviorSubject<List<GamePersistenceServiceCard>>
      currentCardsChangeSubject;

  PersistenceService({
    required final List<PersistenceServiceModelConfigCard> beerculesCards,
  })  : defaultBeerculesCards = beerculesCards,
        configCardsChangeSubject =
            BehaviorSubject<List<CustomizePersistenceServiceModelCard>>(),
        currentCardsChangeSubject =
            BehaviorSubject<List<GamePersistenceServiceCard>>(),
        super(
          PersistenceServiceModel(
            configCards: beerculesCards,
            currentGameCards: _toPersistenceServiceModelCard(beerculesCards),
          ),
        ) {
    emitStateChange();
    addListener((final _) => emitStateChange());
  }

  void emitStateChange() {
    configCardsChangeSubject.add(
      state.configCards
          .map(
            (final PersistenceServiceModelConfigCard card) =>
                CustomizePersistenceServiceModelCard(
              type: card.type,
              amount: card.amount,
            ),
          )
          .toList(),
    );
    currentCardsChangeSubject.add(
      state.currentGameCards
          .map(
            (final PersistenceServiceModelActiveGameCard card) =>
                GamePersistenceServiceCard(
              id: card.id,
              type: card.type,
              wasPlayed: card.wasPlayed,
            ),
          )
          .toList(),
    );
  }

  static List<PersistenceServiceModelActiveGameCard>
      _toPersistenceServiceModelCard(
    final List<PersistenceServiceModelConfigCard> configCards,
  ) =>
          configCards
              .map(
                (final PersistenceServiceModelConfigCard card) => List<
                    ({
                      PersistenceServiceModelConfigCard card,
                      int index
                    })>.generate(
                  card.amount,
                  (final int index) => (index: index, card: card),
                ),
              )
              .expand((final _) => _)
              .map(
                (
                  final ({
                    PersistenceServiceModelConfigCard card,
                    int index
                  }) card,
                ) =>
                    PersistenceServiceModelActiveGameCard(
                  type: card.card.type,
                  wasPlayed: false,
                  id: card.card.type.toString() + card.index.toString(),
                ),
              )
              .toList();

  @override
  void setCurrentToDefault() {
    state = state.copyWith(
      currentGameCards: _toPersistenceServiceModelCard(defaultBeerculesCards),
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
      currentGameCards: _toPersistenceServiceModelCard(state.configCards),
    );
  }

  @override
  void decreaseCurrentGameCardsAmount({required final String cardId}) {
    state = state.copyWith(
      currentGameCards: state.currentGameCards
          .map(
            (final PersistenceServiceModelActiveGameCard card) =>
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
            (final PersistenceServiceModelConfigCard card) =>
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
