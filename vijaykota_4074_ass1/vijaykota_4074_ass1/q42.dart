void printNumbers(int a, int b, [int? c]) {
  print('a = $a, b = $b, c = $c');
}

void main() {
  printNumbers(10, 20);
  printNumbers(10, 20, 30);
}
