class Student {
  int id;
  String name;

  Student(this.id, this.name);

  @override
  String toString() {
    return 'Student{id: $id, name: $name}';
  }
}

void main() {
  Student s = Student(1, 'John');
  print(s);
}
