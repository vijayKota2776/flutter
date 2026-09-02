void printDetails({required String name, int age = 18}) {
  print('Name: $name, Age: $age');
}

void main() {
  printDetails(name: 'Alice');
  printDetails(name: 'Bob', age: 22);
}
