class Student implements Comparable<Student> {
  String name;
  int marks;

  Student(this.name, this.marks);

  @override
  int compareTo(Student other) {
    return this.marks.compareTo(other.marks);
  }
}

void main() {
  List<Student> students = [
    Student('Alice', 85),
    Student('Bob', 92),
    Student('Charlie', 78)
  ];

  students.sort();

  for (var s in students) {
    print('${s.name}: ${s.marks}');
  }
}
