import 'package:beercules/shared/beercules_card_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customize_model.freezed.dart';

@freezed
class CustomizeModel with _$CustomizeModel {
  factory CustomizeModel({
    required String? selectedCardKey,
    required List<BeerculesCard> configCards,
  }) = _CustomizeModel;
}