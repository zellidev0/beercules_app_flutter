class GameModel {
  final Map<String, int> cards;
  final int cardsSwiped;

//<editor-fold desc="Data Methods">

  GameModel({
    required this.cards,
  }) : cardsSwiped = cards.values.reduce((value, element) => value + element);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameModel &&
          runtimeType == other.runtimeType &&
          cards == other.cards &&
          cardsSwiped == other.cardsSwiped);

  @override
  int get hashCode => cards.hashCode ^ cardsSwiped.hashCode;

  @override
  String toString() {
    return 'GameModel{' +
        ' cards: $cards,' +
        ' cardsSwiped: $cardsSwiped,' +
        '}';
  }

  GameModel copyWith({
    Map<String, int>? cards,
    int? cardsSwiped,
  }) {
    return GameModel(
      cards: cards ?? this.cards,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cards': this.cards,
      'cardsSwiped': this.cardsSwiped,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      cards: map['cards'] as Map<String, int>,
    );
  }

//</editor-fold>
}
