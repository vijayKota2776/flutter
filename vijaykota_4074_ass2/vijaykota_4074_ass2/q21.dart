void main() {
  Set<String> vowels = {'a', 'e', 'i', 'o', 'u'};

  bool hasA = vowels.contains('a');
  bool hasZ = vowels.contains('z');

  print('Vowels Set: $vowels');
  print('Contains "a": $hasA');
  print('Contains "z": $hasZ');
}
