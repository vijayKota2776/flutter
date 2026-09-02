void main() {
  Map<String, String> capitals = {
    'India': 'New Delhi',
    'USA': 'Washington D.C.',
    'Japan': 'Tokyo',
  };

  print('Iterating over keys:');
  for (String country in capitals.keys) {
    print('Country: $country');
  }

  print('
Iterating over values:');
  for (String capital in capitals.values) {
    print('Capital: $capital');
  }

  print('
Iterating over entries:');
  for (MapEntry<String, String> entry in capitals.entries) {
    print('Country: ${entry.key}, Capital: ${entry.value}');
  }
}
