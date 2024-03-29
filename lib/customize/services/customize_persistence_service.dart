import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customize_persistence_service.freezed.dart';

abstract class CustomizePersistenceService {
  void resetToDefaultCards();
  void resetToConfig();
  void modifyConfigGameCardsAmount({
    required final BeerculesCardType? cardType,
    required final int amount,
  });
  Stream<List<CustomizePersistenceServiceModelCard>>
      get configCardsChangeStream;
}

@freezed
class CustomizePersistenceServiceModelCard
    with _$CustomizePersistenceServiceModelCard {
  factory CustomizePersistenceServiceModelCard({
    required final BeerculesCardType type,
    required final int amount,
  }) = _CustomizePersistenceServiceModelCard;
}
