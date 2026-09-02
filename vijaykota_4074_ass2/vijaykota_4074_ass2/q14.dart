void main() {
  Map<int, int> numberSquares = {
    1: 1,
    2: 4,
    3: 9,
    4: 16,
  };

  Map<int, int> swappedMap = numberSquares.map((key, value) => MapEntry(value, key));
  print('Original Map (number -> square): $numberSquares');
  print('Swapped Map (square -> number): $swappedMap');

  print('
Iterating with forEach:');
  numberSquares.forEach((key, value) {
    print('Square of $key is $value');
  });
}
