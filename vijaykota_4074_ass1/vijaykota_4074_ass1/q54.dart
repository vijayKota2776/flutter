void main() {
  int num = 12345;
  int reversed = 0;

  int temp = num;
  while (temp > 0) {
    int rem = temp % 10;
    reversed = reversed * 10 + rem;
    temp ~/= 10;
  }

  print('Original: $num, Reversed: $reversed');
}
