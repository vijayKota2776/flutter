void main() {
  // 1. For Loop -> Table of 2
  print("=== Table of 2 (For Loop) ===");
  for (int i = 1; i <= 10; i++) {
    print("2 * $i = ${2 * i}");
  }

  // 2. While Loop -> Table of 3
  print("\n=== Table of 3 (While Loop) ===");
  int j = 1;
  while (j <= 10) {
    print("3 * $j = ${3 * j}");
    j++;
  }

  // 3. Do-While Loop -> Table of 4
  print("\n=== Table of 4 (Do-While Loop) ===");
  int k = 1;
  do {
    print("4 * $k = ${4 * k}");
    k++;
  } while (k <= 10);
}
