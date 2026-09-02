bool isAnagram(String str1, String str2) {
  List<String> a = str1.toLowerCase().split('')..sort();
  List<String> b = str2.toLowerCase().split('')..sort();
  return a.join('') == b.join('');
}

void main() {
  print(isAnagram('listen', 'silent'));
  print(isAnagram('hello', 'world'));
}
