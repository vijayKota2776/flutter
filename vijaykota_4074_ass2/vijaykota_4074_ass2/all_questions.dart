// Dart Collections - All 25 Practice Questions Solutions

// Question 1: Create and print a List of integers
void question1() {
    List<int> numbers = [10, 20, 30, 40, 50];
    print('List of integers: $numbers');
    print('First element: ${numbers.first}');
    print('Last element: ${numbers.last}');
    print('Length of list: ${numbers.length}');
}

// Question 2: Add and remove elements from a List
void question2() {
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

// Question 3: Iterate over a List using for-in and forEach
void question3() {
    List<String> fruits = ['Apple', 'Banana', 'Mango', 'Orange'];
  
    print('Using for-in loop:');
    for (String fruit in fruits) {
      print(fruit);
    }
  
    print('
  Using forEach method:');
    fruits.forEach((fruit) => print(fruit));
}

// Question 4: Filter a List using where()
void question4() {
    List<int> numbers = List.generate(20, (index) => index + 1);
    List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  
    print('Original List (1-20): $numbers');
    print('Filtered List (Even Numbers): $evenNumbers');
}

// Question 5: Transform a List using map()
void question5() {
    List<int> numbers = [1, 2, 3, 4, 5];
    List<int> squaredNumbers = numbers.map((number) => number * number).toList();
  
    print('Original List: $numbers');
    print('Squared List: $squaredNumbers');
}

// Question 6: Sort a List of strings and integers
void question6() {
    List<String> fruits = ['banana', 'apple', 'cherry'];
    fruits.sort();
    print('Sorted Strings (Ascending): $fruits');
  
    List<int> numbers = [5, 2, 8, 1, 9];
    numbers.sort((a, b) => b.compareTo(a));
    print('Sorted Integers (Descending): $numbers');
}

// Question 7: List operations: contains, indexOf, and sublist
void question7() {
    List<String> colors = ['red', 'green', 'blue', 'yellow', 'purple'];
  
    bool containsRed = colors.contains('red');
    print('Contains "red": $containsRed');
  
    int indexOfGreen = colors.indexOf('green');
    print('Index of "green": $indexOfGreen');
  
    List<String> sublistColors = colors.sublist(1, 4);
    print('Sublist from index 1 to 3: $sublistColors');
}

// Question 8: Remove duplicates from a List using Set
void question8() {
    List<int> numbersWithDuplicates = [1, 2, 2, 3, 4, 4, 5, 1];
    Set<int> uniqueSet = numbersWithDuplicates.toSet();
    List<int> deduplicatedList = uniqueSet.toList();
  
    print('Original List: $numbersWithDuplicates');
    print('Converted Set: $uniqueSet');
    print('Deduplicated List: $deduplicatedList');
}

// Question 9: Find frequency of each element in a List
void question9() {
    List<int> numbers = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4];
    Map<int, int> frequencyMap = {};
  
    for (int number in numbers) {
      frequencyMap[number] = (frequencyMap[number] ?? 0) + 1;
    }
  
    print('Element frequencies:');
    frequencyMap.forEach((key, value) {
      print('Element $key appears $value time(s)');
    });
}

// Question 10: Create and print a Map (key-value pairs)
void question10() {
    Map<String, int> studentMarks = {
      'Alice': 85,
      'Bob': 92,
      'Charlie': 78,
    };
  
    print('Student Marks Map: $studentMarks');
    print('Marks of Alice: ${studentMarks["Alice"]}');
}

// Question 11: Add, update, and remove entries in a Map
void question11() {
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

// Question 12: Iterate over a Map using keys, values, and entries
void question12() {
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

// Question 13: Check if a key or value exists in a Map
void question13() {
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

// Question 14: Transform a Map using map() and forEach
void question14() {
    Map<int, int> numberSquares = {
      1: 1,
      2: 4,
      3: 9,
      4: 16,
    };
  
    Map<int, int> swappedMap = numberSquares.map((key, value) => MapEntry(value, key));
    print('Original Map (number -> square): $numberSquares');
    print('Swapped Map (square -> number): $swappedMap');
  
    print('
  Iterating with forEach:');
    numberSquares.forEach((key, value) {
      print('Square of $key is $value');
    });
}

// Question 15: Merge two Maps using spread operator and addAll
void question15() {
    Map<String, int> map1 = {'a': 1, 'b': 2};
    Map<String, int> map2 = {'b': 3, 'c': 4};
  
    Map<String, int> mergedSpread = {...map1, ...map2};
    print('Merged using spread operator (...): $mergedSpread');
  
    Map<String, int> mergedAddAll = Map.from(map1)..addAll(map2);
    print('Merged using addAll(): $mergedAddAll');
}

// Question 16: Get keys, values, and length of a Map
void question16() {
    Map<String, String> userProfiles = {
      'id': '101',
      'name': 'John Doe',
      'email': 'john@example.com',
      'role': 'Admin',
      'status': 'Active',
    };
  
    List<String> keysList = userProfiles.keys.toList();
    List<String> valuesList = userProfiles.values.toList();
    int totalEntries = userProfiles.length;
  
    print('Keys List: $keysList');
    print('Values List: $valuesList');
    print('Map Length: $totalEntries');
}

// Question 17: Find frequency of characters in a String using Map
void question17() {
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

// Question 18: Create and print a Set (unique elements)
void question18() {
    Set<int> numberSet = {1, 2, 2, 3, 3, 4, 5, 5};
  
    print('Set elements (duplicates auto-removed): $numberSet');
    print('Set length: ${numberSet.length}');
}

// Question 19: Add and remove elements from a Set
void question19() {
    Set<String> languages = {'Dart', 'Flutter'};
    print('Original Set: $languages');
  
    languages.add('Python');
    print('After add("Python"): $languages');
  
    languages.addAll({'Java', 'Kotlin'});
    print('After addAll({"Java", "Kotlin"}): $languages');
  
    languages.remove('Java');
    print('After remove("Java"): $languages');
}

// Question 20: Set operations: union, intersection, and difference
void question20() {
    Set<int> setA = {1, 2, 3, 4};
    Set<int> setB = {3, 4, 5, 6};
  
    Set<int> unionSet = setA.union(setB);
    Set<int> intersectionSet = setA.intersection(setB);
    Set<int> differenceSet = setA.difference(setB);
  
    print('Set A: $setA');
    print('Set B: $setB');
    print('Union (A ∪ B): $unionSet');
    print('Intersection (A ∩ B): $intersectionSet');
    print('Difference (A - B): $differenceSet');
}

// Question 21: Check if an element exists in a Set
void question21() {
    Set<String> vowels = {'a', 'e', 'i', 'o', 'u'};
  
    bool hasA = vowels.contains('a');
    bool hasZ = vowels.contains('z');
  
    print('Vowels Set: $vowels');
    print('Contains "a": $hasA');
    print('Contains "z": $hasZ');
}

// Question 22: Convert List to Set and Set to List
void question22() {
    List<int> numbers = [10, 20, 20, 30, 40, 40, 50];
    Set<int> numberSet = numbers.toSet();
    List<int> uniqueList = numberSet.toList();
  
    print('Original List: $numbers');
    print('Converted Set: $numberSet');
    print('Converted back to List: $uniqueList');
}

// Question 23: Iterate over a Set using for-in and forEach
void question23() {
    Set<String> colors = {'red', 'green', 'blue'};
  
    print('Iterating using for-in loop:');
    for (String color in colors) {
      print(color);
    }
  
    print('
  Iterating using forEach method:');
    colors.forEach((color) => print(color));
}

// Question 24: Find common elements between two Lists using Set
void question24() {
    List<int> list1 = [1, 2, 3, 4, 5];
    List<int> list2 = [4, 5, 6, 7, 8];
  
    Set<int> set1 = list1.toSet();
    Set<int> set2 = list2.toSet();
  
    Set<int> commonElements = set1.intersection(set2);
  
    print('List 1: $list1');
    print('List 2: $list2');
    print('Common Elements: ${commonElements.toList()}');
}

// Question 25: Remove duplicates from a List using Set and preserve order
void question25() {
    List<int> numbers = [3, 1, 2, 3, 1, 2, 4, 5];
    List<int> uniqueOrdered = numbers.toSet().toList();
  
    print('Original List with duplicates: $numbers');
    print('Deduplicated List preserving order: $uniqueOrdered');
}

void main() {
  print('=== DART COLLECTIONS ASSIGNMENT 2 - ALL SOLUTIONS ===
');

  print('--- Question 1: Create and print a List of integers ---');
  question1();
  print('');

  print('--- Question 2: Add and remove elements from a List ---');
  question2();
  print('');

  print('--- Question 3: Iterate over a List using for-in and forEach ---');
  question3();
  print('');

  print('--- Question 4: Filter a List using where() ---');
  question4();
  print('');

  print('--- Question 5: Transform a List using map() ---');
  question5();
  print('');

  print('--- Question 6: Sort a List of strings and integers ---');
  question6();
  print('');

  print('--- Question 7: List operations: contains, indexOf, and sublist ---');
  question7();
  print('');

  print('--- Question 8: Remove duplicates from a List using Set ---');
  question8();
  print('');

  print('--- Question 9: Find frequency of each element in a List ---');
  question9();
  print('');

  print('--- Question 10: Create and print a Map (key-value pairs) ---');
  question10();
  print('');

  print('--- Question 11: Add, update, and remove entries in a Map ---');
  question11();
  print('');

  print('--- Question 12: Iterate over a Map using keys, values, and entries ---');
  question12();
  print('');

  print('--- Question 13: Check if a key or value exists in a Map ---');
  question13();
  print('');

  print('--- Question 14: Transform a Map using map() and forEach ---');
  question14();
  print('');

  print('--- Question 15: Merge two Maps using spread operator and addAll ---');
  question15();
  print('');

  print('--- Question 16: Get keys, values, and length of a Map ---');
  question16();
  print('');

  print('--- Question 17: Find frequency of characters in a String using Map ---');
  question17();
  print('');

  print('--- Question 18: Create and print a Set (unique elements) ---');
  question18();
  print('');

  print('--- Question 19: Add and remove elements from a Set ---');
  question19();
  print('');

  print('--- Question 20: Set operations: union, intersection, and difference ---');
  question20();
  print('');

  print('--- Question 21: Check if an element exists in a Set ---');
  question21();
  print('');

  print('--- Question 22: Convert List to Set and Set to List ---');
  question22();
  print('');

  print('--- Question 23: Iterate over a Set using for-in and forEach ---');
  question23();
  print('');

  print('--- Question 24: Find common elements between two Lists using Set ---');
  question24();
  print('');

  print('--- Question 25: Remove duplicates from a List using Set and preserve order ---');
  question25();
  print('');

}
