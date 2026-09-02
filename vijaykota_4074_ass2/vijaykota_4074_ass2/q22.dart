void main() {
  List<int> numbers = [10, 20, 20, 30, 40, 40, 50];
  Set<int> numberSet = numbers.toSet();
  List<int> uniqueList = numberSet.toList();

  print('Original List: $numbers');
  print('Converted Set: $numberSet');
  print('Converted back to List: $uniqueList');
}
