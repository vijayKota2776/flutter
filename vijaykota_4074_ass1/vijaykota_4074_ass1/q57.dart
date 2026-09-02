bool isPerfect(int n) {
  if (n <= 1) return false;
  int sum = 0;
  for (int i = 1; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      sum += i;
    }
  }
  return sum == n;
}

void main() {
  print('6 is perfect: ${isPerfect(6)}');
  print('28 is perfect: ${isPerfect(28)}');
  print('12 is perfect: ${isPerfect(12)}');
}
