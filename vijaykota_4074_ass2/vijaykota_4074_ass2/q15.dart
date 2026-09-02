void main() {
  Map<String, int> map1 = {'a': 1, 'b': 2};
  Map<String, int> map2 = {'b': 3, 'c': 4};

  Map<String, int> mergedSpread = {...map1, ...map2};
  print('Merged using spread operator (...): $mergedSpread');

  Map<String, int> mergedAddAll = Map.from(map1)..addAll(map2);
  print('Merged using addAll(): $mergedAddAll');
}
