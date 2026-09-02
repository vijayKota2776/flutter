bool isPalindrome(String s) {
  String clean = s.toLowerCase();
  String rev = clean.split('').reversed.join('');
  return clean == rev;
}

void main() {
  print(isPalindrome('radar'));
  print(isPalindrome('hello'));
}
