class GameModel {
  final Map<String, int> cards;

//<editor-fold desc="Data Methods">

  const GameModel({
    required this.cards,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameModel &&
          runtimeType == other.runtimeType &&
          cards == other.cards);

  @override
  int get hashCode => cards.hashCode;

  @override
  String toString() {
    return 'GameModel{' + ' cards: $cards,' + '}';
  }

  GameModel copyWith({
    Map<String, int>? cards,
  }) {
    return GameModel(
      cards: cards ?? this.cards,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cards': this.cards,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      cards: map['cards'] as Map<String, int>,
    );
  }

//</editor-fold>
}

const defaultModel = GameModel(
  cards: {
    "ABSTIMMUNG": 3,
    "ALLE_FUER_EINEN": 0,
    "AUFZAEHLUNG": 3,
    "BEER_LOVE": 3,
    "BIERGOTT": 2,
    "DECKEL_DRAUF": 2,
    "DREI_GESCHENKE_VON_HERZEN": 1,
    "EIN_GESCHENK_VON_HERZEN": 1,
    "EISPRINZESSIN": 2,
    "FILMRISS": 2,
    "FRAGENKOENIG": 4,
    "HAENDE_HOCH": 2,
    "ICH_HAB_NOCH_NIE": 4,
    "ICH_PACKE_MEINEN_KOFFER_": 0,
    "KETTENREAKTION": 1,
    "KNUTSCHKARTE": 1,
    "LINKS": 1,
    "MENS_HEALTH": 1,
    "OHREN_SPITZEN": 2,
    "OPFERGLAS": 0,
    "RECHTS": 1,
    "REIMSCHWEIN": 2,
    "RICHTUNGSWECHSEL": 2,
    "SCHERE_STEIN_PAAR_BIER": 2,
    "SING_NO_SONG": 1,
    "SPIEGLEIN_SPIEGLEIN": 0,
    "TAUSCHRAUSCH": 1,
    "TRINK_BUDDY": 3,
    "WOMENS_HEALTH": 1,
    "_1_2_3_BIER": 1,
  },
);
