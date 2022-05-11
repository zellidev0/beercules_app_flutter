import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beercules_card_model.freezed.dart';

@freezed
class BeerculesCard with _$BeerculesCard {
  factory BeerculesCard({
    required String key,
    required int amount,
    required bool isBasicRule,
    required bool isVictimGlass,
  }) = _BeerculesCard;
}

@freezed
class BeerculesPlayCard with _$BeerculesPlayCard {
  factory BeerculesPlayCard({
    required String id,
    required String key,
    required bool played,
    required bool isBasicRule,
    required bool isVictimGlass,
  }) = _BeerculesPlayCard;
}

@freezed
class BeerculesCardProviderModel with _$BeerculesCardProviderModel {
  factory BeerculesCardProviderModel({
    required List<BeerculesPlayCard> currentGameCards,
    required List<BeerculesCard> configCards,
  }) = _BeerculesCardProviderModel;
}

class BeerculesCardProvider extends StateNotifier<BeerculesCardProviderModel> {
  final List<BeerculesCard> defaultBeerculesCards;

  BeerculesCardProvider({
    required List<BeerculesCard> beerculesCards,
  })  : defaultBeerculesCards = beerculesCards,
        super(BeerculesCardProviderModel(
          configCards: beerculesCards,
          currentGameCards: _toPlayingCard(beerculesCards),
        ));

  static List<BeerculesPlayCard> _toPlayingCard(
      List<BeerculesCard> beerculesCards) {
    return beerculesCards
        .map((card) => List.generate(card.amount, (index) => [index, card]))
        .expand((_) => _)
        .map((card) => BeerculesPlayCard(
              key: (card[1] as BeerculesCard).key,
              played: false,
              isBasicRule: (card[1] as BeerculesCard).isBasicRule,
              isVictimGlass: (card[1] as BeerculesCard).isVictimGlass,
              id: (card[1] as BeerculesCard).key + card[0].toString(),
            ))
        .toList();
  }

  void setCurrentToDefault() {
    state = state.copyWith(
      currentGameCards: _toPlayingCard(defaultBeerculesCards),
    );
  }

  void setConfigToDefault() {
    state = state.copyWith(
      configCards: defaultBeerculesCards,
    );
  }

  void setCurrentToConfig() {
    state = state.copyWith(
      currentGameCards: _toPlayingCard(state.configCards),
    );
  }

  void decreaseCurrentGameCardsAmount({required String cardId}) {
    state = state.copyWith(
        currentGameCards: state.currentGameCards
            .map((BeerculesPlayCard card) =>
                card.id == cardId ? card.copyWith(played: true) : card)
            .toList());
  }

  void modifyConfigGameCardsAmount({
    required String cardKey,
    required int amount,
  }) {
    state = state.copyWith(
        configCards: state.configCards
            .map((BeerculesCard card) =>
                card.key == cardKey ? card.copyWith(amount: amount) : card)
            .toList());
  }
}
