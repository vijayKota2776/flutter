void main() {
  Map<String, double> products = {
    'Laptop': 999.99,
    'Phone': 699.99,
    'Tablet': 399.99,
  };

  bool hasLaptop = products.containsKey('Laptop');
  bool hasWatch = products.containsKey('Watch');
  bool hasPrice = products.containsValue(699.99);

  print('Contains key "Laptop": $hasLaptop');
  print('Contains key "Watch": $hasWatch');
  print('Contains value 699.99: $hasPrice');
}
