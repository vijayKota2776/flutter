void main() {
  // Sample list with duplicate elements
  List<dynamic> list = [1, 2, 3, 2, 4, 5, 1, 6, 2, 'apple', 'banana', 'apple'];
  print('Original List: $list\n');

  // 1. Frequency table of list elements
  Map<dynamic, int> frequencyTable = {};
  for (var element in list) {
    frequencyTable[element] = (frequencyTable[element] ?? 0) + 1;
  }

  print('--- 1. Frequency Table ---');
  frequencyTable.forEach((key, count) {
    print('$key : $count');
  });

  // 2. Elements which are duplicated (frequency > 1)
  List<dynamic> duplicates = frequencyTable.entries
      .where((entry) => entry.value > 1)
      .map((entry) => entry.key)
      .toList();

  print('\n--- 2. Duplicated Elements ---');
  print(duplicates);

  // 3. Remove duplicates (preserve unique elements)
  List<dynamic> uniqueList = list.toSet().toList();

  print('\n--- 3. List After Removing Duplicates ---');
  print(uniqueList);
}
