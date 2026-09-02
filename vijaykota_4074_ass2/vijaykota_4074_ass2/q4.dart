void main() {
  List<int> numbers = List.generate(20, (index) => index + 1);
  List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();

  print('Original List (1-20): $numbers');
  print('Filtered List (Even Numbers): $evenNumbers');
}
