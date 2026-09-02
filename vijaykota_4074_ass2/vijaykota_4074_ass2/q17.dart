void main() {
  String text = 'hello world';
  Map<String, int> charFrequency = {};

  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    if (char != ' ') {
      charFrequency[char] = (charFrequency[char] ?? 0) + 1;
    }
  }

  print('String: "$text"');
  print('Character Frequencies (excluding spaces): $charFrequency');
}
