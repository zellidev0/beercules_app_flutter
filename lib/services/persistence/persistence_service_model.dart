import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'persistence_service_model.freezed.dart';

@freezed
class PersistenceServiceModelConfigCard
    with _$PersistenceServiceModelConfigCard {
  factory PersistenceServiceModelConfigCard({
    required int amount,
    required BeerculesCardType type,
  }) = _PersistenceServiceModelConfigCard;
}

@freezed
class PersistenceServiceModel with _$PersistenceServiceModel {
  factory PersistenceServiceModel({
    required List<PersistenceServiceModelActiveGameCard> currentGameCards,
    required List<PersistenceServiceModelConfigCard> configCards,
  }) = _PersistenceServiceModel;
}

@freezed
class PersistenceServiceModelActiveGameCard
    with _$PersistenceServiceModelActiveGameCard {
  factory PersistenceServiceModelActiveGameCard({
    required String id,
    required BeerculesCardType type,
    required bool wasPlayed,
  }) = _PersistenceServiceModelActiveGameCard;
}
