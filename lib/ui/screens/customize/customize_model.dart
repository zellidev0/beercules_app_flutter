import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customize_model.freezed.dart';

@freezed
class CustomizeModel with _$CustomizeModel {
  factory CustomizeModel({
    required BeerculesCardType? selectedCardType,
    required List<CustomizeModelCard> configCards,
  }) = _CustomizeModel;
}

@freezed
class CustomizeModelCard with _$CustomizeModelCard {
  factory CustomizeModelCard({
    required BeerculesCardType type,
    required int amount,
  }) = _CustomizeModelCard;
}
