void greet(String name, [String prefix = 'Mr.']) {
  print('Hello $prefix $name');
}

void main() {
  greet('Smith');
  greet('Johnson', 'Dr.');
}
