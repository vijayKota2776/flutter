String reverseString(String s) {
  return s.split('').reversed.join('');
}

void main() {
  print(reverseString('hello'));
}
