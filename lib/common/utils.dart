import 'dart:math';

List<T> shuffle<T>(final int seed, final List<T> items) {
  final Random random = Random(seed);
  for (int i = items.length - 1; i > 0; i--) {
    final int n = random.nextInt(i + 1);
    final T temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

List<T> shuffleCards<T>({
  required final List<T> cards,
  required final bool Function(T element) conditionToSortFirst,
}) =>
    <T>[
      ...shuffle(
        Random().nextInt(10),
        cards.where((final _) => !conditionToSortFirst(_)).toList(),
      ),
      ...cards.where(conditionToSortFirst),
    ];
