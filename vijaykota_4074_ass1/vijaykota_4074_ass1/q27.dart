int sumOfDigits(int num) {
  int sum = 0;
  int temp = num.abs();
  while (temp > 0) {
    sum += temp % 10;
    temp ~/= 10;
  }
  return sum;
}

void main() {
  print('Sum of digits of 12345: ${sumOfDigits(12345)}');
}
