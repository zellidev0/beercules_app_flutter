import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  factory GameModel({
    required final List<GameModelCard> cards,
    required final int cardTransformSeed,
    required final bool showContinueDialog,
  }) = _GameModel;
}

@freezed
class GameModelCard with _$GameModelCard {
  factory GameModelCard({
    required final String id,
    required final String key,
    required final bool isBasicRule,
    required final bool isVictimGlass,
    required final String victimGlassKey,
    required final bool played,
  }) = _GameModelCard;
}
