import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'persistence_service_model.freezed.dart';

@freezed
class PersistenceServiceModelConfigCard
    with _$PersistenceServiceModelConfigCard {
  factory PersistenceServiceModelConfigCard({
    required final int amount,
    required final BeerculesCardType type,
  }) = _PersistenceServiceModelConfigCard;
}

@freezed
class PersistenceServiceModel with _$PersistenceServiceModel {
  factory PersistenceServiceModel({
    required final List<PersistenceServiceModelActiveGameCard> currentGameCards,
    required final List<PersistenceServiceModelConfigCard> configCards,
  }) = _PersistenceServiceModel;
}

@freezed
class PersistenceServiceModelActiveGameCard
    with _$PersistenceServiceModelActiveGameCard {
  factory PersistenceServiceModelActiveGameCard({
    required final String id,
    required final BeerculesCardType type,
    required final bool wasPlayed,
  }) = _PersistenceServiceModelActiveGameCard;
}
