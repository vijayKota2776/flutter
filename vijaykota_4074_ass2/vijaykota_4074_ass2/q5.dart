void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> squaredNumbers = numbers.map((number) => number * number).toList();

  print('Original List: $numbers');
  print('Squared List: $squaredNumbers');
}
