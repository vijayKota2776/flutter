void main() {
  Map<String, int> scores = {
    'Alice': 85,
    'Bob': 90,
  };
  print('Original Map: $scores');

  scores['Charlie'] = 95;
  print('After adding Charlie: $scores');

  scores['Alice'] = 88;
  print('After updating Alice: $scores');

  scores.remove('Bob');
  print('After removing Bob: $scores');
}
