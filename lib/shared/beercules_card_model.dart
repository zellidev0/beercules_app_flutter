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

class BeerculesCardProvider extends StateNotifier<List<BeerculesCard>> {
  final List<BeerculesCard> defaultBeerculesCards;
  BeerculesCardProvider({
    required List<BeerculesCard> beerculesCards,
  })  : defaultBeerculesCards = beerculesCards,
        super(beerculesCards);

  void restoreDefault() {
    state = defaultBeerculesCards;
  }
}
