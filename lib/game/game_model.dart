import 'package:beercules/shared/beercules_card_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  factory GameModel({
    required List<GameModelCard> cards,
    required double cardTransformSeed,
    required bool showContinueDialog,
  }) = _GameModel;
}

@freezed
class GameModelCard with _$GameModelCard {
  factory GameModelCard({
    required String id,
    required String key,
    required bool isBasicRule,
    required bool isVictimGlass,
    required String victimGlassKey,
    required bool played,
  }) = _GameModelCard;
}
