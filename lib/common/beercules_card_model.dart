import 'package:beercules/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beercules_card_model.freezed.dart';

@freezed
class BeerculesCard with _$BeerculesCard {
  factory BeerculesCard({
    required final BeerculesCardType key,
    required final int amount,
    required final bool isBasicRule,
    required final bool isVictimGlass,
  }) = _BeerculesCard;
}

@freezed
class BeerculesPlayCard with _$BeerculesPlayCard {
  factory BeerculesPlayCard({
    required final String id,
    required final BeerculesCardType key,
    required final bool played,
    required final bool isBasicRule,
    required final bool isVictimGlass,
  }) = _BeerculesPlayCard;
}

@freezed
class BeerculesCardProviderModel with _$BeerculesCardProviderModel {
  factory BeerculesCardProviderModel({
    required final List<BeerculesPlayCard> currentGameCards,
    required final List<BeerculesCard> configCards,
  }) = _BeerculesCardProviderModel;
}

class BeerculesCardProvider extends StateNotifier<BeerculesCardProviderModel> {
  final List<BeerculesCard> defaultBeerculesCards;

  BeerculesCardProvider({
    required final List<BeerculesCard> beerculesCards,
  })  : defaultBeerculesCards = beerculesCards,
        super(
          BeerculesCardProviderModel(
            configCards: beerculesCards,
            currentGameCards: _toPlayingCard(beerculesCards),
          ),
        );

  static List<BeerculesPlayCard> _toPlayingCard(
    final List<BeerculesCard> beerculesCards,
  ) =>
      beerculesCards
          .map(
            (final BeerculesCard card) => List<List<Object>>.generate(
              card.amount,
              (final int index) => <Object>[index, card],
            ),
          )
          .expand((final _) => _)
          .map(
            (final List<Object> card) => BeerculesPlayCard(
              key: (card[1] as BeerculesCard).key,
              played: false,
              isBasicRule: (card[1] as BeerculesCard).isBasicRule,
              isVictimGlass: (card[1] as BeerculesCard).isVictimGlass,
              id: (card[1] as BeerculesCard).key.toString() +
                  card[0].toString(),
            ),
          )
          .toList();

  void setCurrentToDefault() {
    state = state.copyWith(
      currentGameCards: _toPlayingCard(defaultBeerculesCards),
    );
  }

  void resetToDefaultCards() {
    state = state.copyWith(
      configCards: defaultBeerculesCards,
    );
  }

  void setCurrentToConfig() {
    state = state.copyWith(
      currentGameCards: _toPlayingCard(state.configCards),
    );
  }

  void decreaseCurrentGameCardsAmount({required final String cardId}) {
    state = state.copyWith(
      currentGameCards: state.currentGameCards
          .map(
            (final BeerculesPlayCard card) =>
                card.id == cardId ? card.copyWith(played: true) : card,
          )
          .toList(),
    );
  }

  void modifyConfigGameCardsAmount({
    required final BeerculesCardType? cardKey,
    required final int amount,
  }) {
    state = state.copyWith(
      configCards: state.configCards
          .map(
            (final BeerculesCard card) =>
                card.key == cardKey ? card.copyWith(amount: amount) : card,
          )
          .toList(),
    );
  }

  bool currentGameHasBeenStarted() =>
      state.currentGameCards.where((final _) => _.played).isEmpty;

  bool configDiffersFromDefault() =>
      !listEquals(state.configCards, defaultBeerculesCards);
}
