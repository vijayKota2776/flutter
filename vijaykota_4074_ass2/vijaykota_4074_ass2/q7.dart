void main() {
  List<String> colors = ['red', 'green', 'blue', 'yellow', 'purple'];

  bool containsRed = colors.contains('red');
  print('Contains "red": $containsRed');

  int indexOfGreen = colors.indexOf('green');
  print('Index of "green": $indexOfGreen');

  List<String> sublistColors = colors.sublist(1, 4);
  print('Sublist from index 1 to 3: $sublistColors');
}
