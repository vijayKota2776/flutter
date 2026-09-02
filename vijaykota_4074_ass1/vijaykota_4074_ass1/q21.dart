void main() {
  int n = 5;
  int fact = 1;

  for (int i = 1; i <= n; i++) {
    fact *= i;
  }

  print('Factorial of $n is $fact');
}
