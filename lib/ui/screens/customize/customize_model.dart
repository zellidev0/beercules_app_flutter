import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customize_model.freezed.dart';

@freezed
class CustomizeModel with _$CustomizeModel {
  factory CustomizeModel({
    required final BeerculesCardType? selectedCardType,
    required final List<CustomizeModelCard> cards,
  }) = _CustomizeModel;
}

@freezed
class CustomizeModelCard with _$CustomizeModelCard {
  factory CustomizeModelCard({
    required final BeerculesCardType type,
    required final int amount,
  }) = _CustomizeModelCard;
}
