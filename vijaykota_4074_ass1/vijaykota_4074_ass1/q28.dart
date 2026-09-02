class Student {
  int rollNo;
  String name;
  double marks;

  Student(this.rollNo, this.name, this.marks);

  void display() {
    print('Roll No: $rollNo, Name: $name, Marks: $marks');
  }
}

void main() {
  Student s1 = Student(101, 'John', 88.5);
  s1.display();
}
