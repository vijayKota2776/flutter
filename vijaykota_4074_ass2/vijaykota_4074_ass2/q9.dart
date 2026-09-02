void main() {
  List<int> numbers = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4];
  Map<int, int> frequencyMap = {};

  for (int number in numbers) {
    frequencyMap[number] = (frequencyMap[number] ?? 0) + 1;
  }

  print('Element frequencies:');
  frequencyMap.forEach((key, value) {
    print('Element $key appears $value time(s)');
  });
}
