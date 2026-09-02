bool isPalindrome(int num) {
  int original = num;
  int rev = 0;
  int temp = num;

  while (temp > 0) {
    int rem = temp % 10;
    rev = rev * 10 + rem;
    temp ~/= 10;
  }

  return original == rev;
}

void main() {
  print(isPalindrome(121));
  print(isPalindrome(123));
}
