void main() {
  List<String> fruits = ['banana', 'apple', 'cherry'];
  fruits.sort();
  print('Sorted Strings (Ascending): $fruits');

  List<int> numbers = [5, 2, 8, 1, 9];
  numbers.sort((a, b) => b.compareTo(a));
  print('Sorted Integers (Descending): $numbers');
}
