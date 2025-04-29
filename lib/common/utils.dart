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
