import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  factory GameModel({
    required final List<GameModelCard> cards,
    required final int amountOfCardsLeft,
    required final bool shouldShowContinueDialog,
  }) = _GameModel;
}

@freezed
class GameModelCard with _$GameModelCard {
  factory GameModelCard({
    required final String id,
    required final int transformationAngle,
    required final BeerculesCardType type,
    required final bool wasPlayed,
  }) = _GameModelCard;
}
