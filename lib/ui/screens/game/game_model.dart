import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  factory GameModel({
    required final int? amountOfCardsLeft,
    required final int? initialCards,
    required final BannerAd? bannerAd,
  }) = _GameModel;
}

@freezed
class GameModelCard with _$GameModelCard {
  factory GameModelCard({
    required final String id,
    required final bool wasPlayed,
    required final BeerculesCardType type,
  }) = _GameModelCard;
}
