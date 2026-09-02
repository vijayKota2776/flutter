void main() {
  Set<String> languages = {'Dart', 'Flutter'};
  print('Original Set: $languages');

  languages.add('Python');
  print('After add("Python"): $languages');

  languages.addAll({'Java', 'Kotlin'});
  print('After addAll({"Java", "Kotlin"}): $languages');

  languages.remove('Java');
  print('After remove("Java"): $languages');
}
