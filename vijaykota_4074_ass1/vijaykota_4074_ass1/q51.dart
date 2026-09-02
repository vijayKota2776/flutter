void main() {
  int a = 12;
  int b = 25;

  print('Before swap: a = $a, b = $b');

  a = a ^ b;
  b = a ^ b;
  a = a ^ b;

  print('After XOR swap: a = $a, b = $b');
}
