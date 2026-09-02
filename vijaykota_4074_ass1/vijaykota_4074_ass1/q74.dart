int countVowels(String s) {
  int count = 0;
  String vowels = 'aeiouAEIOU';
  for (int i = 0; i < s.length; i++) {
    if (vowels.contains(s[i])) {
      count++;
    }
  }
  return count;
}

void main() {
  print('Vowels count: ${countVowels("Hello World")}');
}
