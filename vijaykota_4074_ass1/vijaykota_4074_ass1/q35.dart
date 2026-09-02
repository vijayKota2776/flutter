class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;
  set name(String val) => _name = val;

  int get age => _age;
  set age(int val) => _age = val;
}

void main() {
  Person p = Person('Alice', 25);
  print('Name: ${p.name}, Age: ${p.age}');

  p.name = 'Bob';
  p.age = 30;
  print('Updated Name: ${p.name}, Updated Age: ${p.age}');
}
