void main() {
  int num = 987654;
  int count = 0;

  int temp = num.abs();
  do {
    count++;
    temp ~/= 10;
  } while (temp > 0);

  print('Number of digits in $num is $count');
}
