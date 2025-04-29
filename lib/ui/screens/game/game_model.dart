import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  factory GameModel({
    required List<GameModelCard> cards,
    required int amountOfCardsLeft,
    required bool shouldShowContinueDialog,
  }) = _GameModel;
}

@freezed
class GameModelCard with _$GameModelCard {
  factory GameModelCard({
    required String id,
    required int transformationAngle,
    required BeerculesCardType type,
    required bool wasPlayed,
  }) = _GameModelCard;
}
