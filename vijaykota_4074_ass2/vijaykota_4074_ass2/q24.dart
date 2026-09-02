void main() {
  List<int> list1 = [1, 2, 3, 4, 5];
  List<int> list2 = [4, 5, 6, 7, 8];

  Set<int> set1 = list1.toSet();
  Set<int> set2 = list2.toSet();

  Set<int> commonElements = set1.intersection(set2);

  print('List 1: $list1');
  print('List 2: $list2');
  print('Common Elements: ${commonElements.toList()}');
}
