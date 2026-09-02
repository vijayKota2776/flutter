void main() {
  Set<int> setA = {1, 2, 3, 4};
  Set<int> setB = {3, 4, 5, 6};

  Set<int> unionSet = setA.union(setB);
  Set<int> intersectionSet = setA.intersection(setB);
  Set<int> differenceSet = setA.difference(setB);

  print('Set A: $setA');
  print('Set B: $setB');
  print('Union (A ∪ B): $unionSet');
  print('Intersection (A ∩ B): $intersectionSet');
  print('Difference (A - B): $differenceSet');
}
