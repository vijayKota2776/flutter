void main() {
  List<String> items = ['Apple', 'Banana'];
  print('Original list: $items');

  items.add('Cherry');
  print('After add("Cherry"): $items');

  items.addAll(['Date', 'Elderberry']);
  print('After addAll(["Date", "Elderberry"]): $items');

  items.remove('Banana');
  print('After remove("Banana"): $items');

  items.removeAt(0);
  print('After removeAt(0): $items');
}
