void main() {
  Set<String> colors = {'red', 'green', 'blue'};

  print('Iterating using for-in loop:');
  for (String color in colors) {
    print(color);
  }

  print('
Iterating using forEach method:');
  colors.forEach((color) => print(color));
}
