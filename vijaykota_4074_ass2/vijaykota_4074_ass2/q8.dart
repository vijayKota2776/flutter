void main() {
  List<int> numbersWithDuplicates = [1, 2, 2, 3, 4, 4, 5, 1];
  Set<int> uniqueSet = numbersWithDuplicates.toSet();
  List<int> deduplicatedList = uniqueSet.toList();

  print('Original List: $numbersWithDuplicates');
  print('Converted Set: $uniqueSet');
  print('Deduplicated List: $deduplicatedList');
}
