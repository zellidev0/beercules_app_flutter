import 'package:beercules/shared/beercules_card_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  factory GameModel({
    required List<BeerculesCard> cards,
    required double cardTransformSeed,
    required bool showContinueDialog,
    required bool showConfigIsDefaultMessage,
  }) = _GameModel;
}
