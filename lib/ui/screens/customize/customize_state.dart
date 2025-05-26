import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customize_state.freezed.dart';

@freezed
class CustomizeState with _$CustomizeState {
  factory CustomizeState({
    required BeerculesCardType? selectedCardType,
    required List<CustomizeModelCard> configCards,
  }) = _CustomizeState;
}

@freezed
class CustomizeModelCard with _$CustomizeModelCard {
  factory CustomizeModelCard({
    required BeerculesCardType type,
    required int amount,
  }) = _CustomizeModelCard;
}
