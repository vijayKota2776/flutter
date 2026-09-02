void main() {
  int a = 12;
  int b = 18;

  int maxVal = (a > b) ? a : b;
  int lcm = maxVal;

  while (true) {
    if (lcm % a == 0 && lcm % b == 0) {
      break;
    }
    lcm += maxVal;
  }

  print('LCM of $a and $b is $lcm');
}
