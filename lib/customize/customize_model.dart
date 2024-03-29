import 'package:beercules/common/beercules_card_model.dart';
import 'package:beercules/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customize_model.freezed.dart';

@freezed
class CustomizeModel with _$CustomizeModel {
  factory CustomizeModel({
    required final BeerculesCardType? selectedCardType,
    required final List<BeerculesCard> configCards,
  }) = _CustomizeModel;
}
