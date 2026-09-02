void main() {
  int a = 15;
  int b = 42;
  int c = 27;

  int largest = (a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c);
  print('Largest of $a, $b, $c is $largest');
}
