import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  factory GameState({
    required List<GameStateCard> cards,
    required int amountOfCardsLeft,
    required bool shouldShowContinueDialog,
  }) = _GameState;
}

@freezed
class GameStateCard with _$GameStateCard {
  factory GameStateCard({
    required String id,
    required int transformationAngle,
    required BeerculesCardType type,
    required bool wasPlayed,
  }) = _GameStateCard;
}
