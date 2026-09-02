void main() {
  List<String> fruits = ['Apple', 'Banana', 'Mango', 'Orange'];

  print('Using for-in loop:');
  for (String fruit in fruits) {
    print(fruit);
  }

  print('
Using forEach method:');
  fruits.forEach((fruit) => print(fruit));
}
