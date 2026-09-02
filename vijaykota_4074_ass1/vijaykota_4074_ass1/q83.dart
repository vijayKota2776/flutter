int factIterative(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

int factRecursive(int n) {
  if (n <= 1) return 1;
  return n * factRecursive(n - 1);
}

void main() {
  print('Iterative (5): ${factIterative(5)}');
  print('Recursive (5): ${factRecursive(5)}');
}
