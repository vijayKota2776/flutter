abstract class Person {
  String name;

  Person(this.name);
}

class Student extends Person {
  int id;

  Student(String name, this.id) : super(name);
}

void main() {
  Student s = Student('John', 101);
  print('Student: ${s.name}, ID: ${s.id}');
}
