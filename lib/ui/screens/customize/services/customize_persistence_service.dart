import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customize_persistence_service.freezed.dart';

abstract class CustomizePersistenceService {
  Future<void> resetCustomGameToDefaultGame();
  Future<void> resetActiveGameToCustomGame();
  Future<void> modifyConfigGameCardsAmount({
    required final BeerculesCardType? cardType,
    required final int amount,
  });
  List<CustomizePersistenceServiceModelCard>? getCustomGame();
  List<CustomizePersistenceServiceModelCard> getDefaultGame();
}

@freezed
class CustomizePersistenceServiceModelCard
    with _$CustomizePersistenceServiceModelCard {
  factory CustomizePersistenceServiceModelCard({
    required final BeerculesCardType type,
    required final int amount,
  }) = _CustomizePersistenceServiceModelCard;
}
