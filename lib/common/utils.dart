import 'dart:math';

List<T> shuffle<T>(int seed, List<T> items) {
  final random = Random(seed);
  for (var i = items.length - 1; i > 0; i--) {
    final n = random.nextInt(i + 1);
    final temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

List<T> shuffleCards<T>({
  required List<T> cards,
  required bool Function(T element) conditionToSortFirst,
}) => <T>[
  ...shuffle(
    Random().nextInt(10),
    cards.where((it) => !conditionToSortFirst(it)).toList(),
  ),
  ...cards.where(conditionToSortFirst),
];
