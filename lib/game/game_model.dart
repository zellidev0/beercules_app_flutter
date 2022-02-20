class GameModel {
  final List<String> cards;

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
    List<String>? cards,
  }) {
    return GameModel(
      cards: cards ?? this.cards,
    );
  }
}
