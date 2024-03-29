import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_persistence_service.freezed.dart';

abstract class GamePersistenceService {
  void setCurrentToDefault();
  void resetToConfig();
  void decreaseCurrentGameCardsAmount({required final String cardId});
  bool currentGameHasBeenStarted();
  bool configDiffersFromDefault();
  Stream<List<GamePersistenceServiceCard>> get currentCardsChangeStream;
}

@freezed
class GamePersistenceServiceCard with _$GamePersistenceServiceCard {
  factory GamePersistenceServiceCard({
    required final BeerculesCardType type,
    required final bool wasPlayed,
    required final String id,
  }) = _GamePersistenceServiceCard;
}
