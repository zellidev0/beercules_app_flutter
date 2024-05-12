import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_persistence_service.freezed.dart';

abstract class GamePersistenceService {
  GamePersistenceServiceGame defaultGame();
  GamePersistenceServiceGame? customGame();
  GamePersistenceServiceGame? activeGame();

  void resetActiveGameToDefaultGame();
  void resetActiveGameToCustomGame();
  void decreaseActiveGameCardAmountByOne(final BeerculesCardType type);
}

@freezed
class GamePersistenceServiceGame with _$GamePersistenceServiceGame {
  factory GamePersistenceServiceGame({
    required final Map<BeerculesCardType, int> cardToAmountMapping,
  }) = _GamePersistenceServiceGame;
}
