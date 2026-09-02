class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._name, this._salary);

  int get id => _id;
  set id(int value) => _id = value;

  String get name => _name;
  set name(String value) => _name = value;

  double get salary => _salary;
  set salary(double value) {
    if (value >= 0) {
      _salary = value;
    }
  }
}

void main() {
  Employee emp = Employee(101, 'Alice', 75000.0);
  print('ID: ${emp.id}, Name: ${emp.name}, Salary: ${emp.salary}');

  emp.salary = 80000.0;
  print('Updated Salary: ${emp.salary}');
}
