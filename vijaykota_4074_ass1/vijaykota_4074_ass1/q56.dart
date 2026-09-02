import 'dart:math';

void main() {
  for (int i = 1; i < 1000; i++) {
    int temp = i;
    int digits = i.toString().length;
    int sum = 0;

    while (temp > 0) {
      int rem = temp % 10;
      sum += pow(rem, digits).toInt();
      temp ~/= 10;
    }

    if (sum == i) {
      print(i);
    }
  }
}
