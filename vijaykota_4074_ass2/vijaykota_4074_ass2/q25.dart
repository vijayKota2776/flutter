void main() {
  List<int> numbers = [3, 1, 2, 3, 1, 2, 4, 5];
  List<int> uniqueOrdered = numbers.toSet().toList();

  print('Original List with duplicates: $numbers');
  print('Deduplicated List preserving order: $uniqueOrdered');
}
