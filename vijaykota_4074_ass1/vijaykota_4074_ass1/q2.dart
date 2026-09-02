void main() {
  int a = 10;
  int b = 20;
  print('Before swap: a = $a, b = $b');

  int temp = a;
  a = b;
  b = temp;
  print('After temp swap: a = $a, b = $b');

  a = a + b;
  b = a - b;
  a = a - b;
  print('After arithmetic swap: a = $a, b = $b');
}
