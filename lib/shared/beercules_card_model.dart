
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beercules_card_model.freezed.dart';


@freezed
class BeerculesCard with _$BeerculesCard {
  factory BeerculesCard({
    required String key,
    required int amount,
    required bool isBasicRule,
  }) = _BeerculesCard;
}
