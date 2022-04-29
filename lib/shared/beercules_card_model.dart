import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beercules_card_model.freezed.dart';

@freezed
class BeerculesCard with _$BeerculesCard {
  factory BeerculesCard({
    required String key,
    required int amount,
    required bool isBasicRule,
  }) = _BeerculesCard;
}

@freezed
class BeerculesCardProviderModel with _$BeerculesCardProviderModel {
  factory BeerculesCardProviderModel({
    required List<BeerculesCard> currentGameCards,
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
          currentGameCards: beerculesCards,
        ));

  void setCurrentToDefault() {
    state = state.copyWith(
      currentGameCards: defaultBeerculesCards,
    );
  }

  void setConfigToDefault() {
    state = state.copyWith(
      configCards: defaultBeerculesCards,
    );
  }

  void decreaseCurrentGameCardsAmount({required String cardKey}) {
    state = state.copyWith(
        currentGameCards: state.currentGameCards
            .map((BeerculesCard card) => card.key == cardKey
                ? card.copyWith(amount: (card.amount - 1).clamp(0, 100000))
                : card)
            .toList());
  }

  void modifyConfigGameCardsAmount({
    required String cardKey,
    required int amount,
  }) {
    state = state.copyWith(
        configCards: state.configCards
            .map((BeerculesCard card) => card.key == cardKey
                ? card.copyWith(amount: amount)
                : card)
            .toList());
  }
}
