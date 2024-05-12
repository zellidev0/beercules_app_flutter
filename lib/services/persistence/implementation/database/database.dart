import 'package:beercules/common/beercules_card_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'database.g.dart';
part 'database.freezed.dart';

abstract class Database {
  Future<void> init();
  Future<void> saveCustomCards(final List<DatabaseCard> cards);
  Future<void> saveActiveGame(final List<DatabaseCard> cards);
  List<DatabaseCard>? readCustomCards();
  List<DatabaseCard>? readActiveGame();
}

@freezed
class DatabaseCard with _$DatabaseCard {
  factory DatabaseCard({
    required final BeerculesCardType type,
    required final int amount,
  }) = _DatabaseCard;

  factory DatabaseCard.fromJson(final Map<String, dynamic> json) =>
      _$DatabaseCardFromJson(json);
}
