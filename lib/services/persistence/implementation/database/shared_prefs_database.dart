import 'dart:async';
import 'dart:convert';

import 'package:beercules/services/persistence/implementation/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsDatabase implements Database {
  static const String configCardsKey = 'configCards';
  static const String currentCardsKey = 'currentCards';
  late final SharedPreferences sharedPreferences;

  SharedPrefsDatabase();

  @override
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  List<DatabaseCard>? readCustomCards() => readGame(configCardsKey);

  @override
  List<DatabaseCard>? readActiveGame() => readGame(currentCardsKey);

  List<DatabaseCard>? readGame(final String key) {
    try {
      final cards = sharedPreferences.getString(key);
      if (cards == null) {
        return null;
      }

      return (jsonDecode(cards) as List<Object?>)
          .map(
            (final Object? object) =>
                object == null
                    ? null
                    : DatabaseCard.fromJson(object as Map<String, Object?>),
          )
          .nonNulls
          .toList();
    } on Exception {
      return null;
    }
  }

  @override
  Future<void> saveCustomCards(final List<DatabaseCard> cards) async =>
      sharedPreferences.setString(configCardsKey, jsonEncode(cards));

  @override
  Future<void> saveActiveGame(final List<DatabaseCard> cards) async =>
      sharedPreferences.setString(currentCardsKey, jsonEncode(cards));
}
