class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);
}

class Manager extends Employee {
  double bonus;

  Manager(String name, double salary, this.bonus) : super(name, salary);

  double getTotalCompensation() {
    return salary + bonus;
  }
}

void main() {
  Manager mgr = Manager('Alice', 80000, 15000);
  print('Manager: ${mgr.name}, Total: ${mgr.getTotalCompensation()}');
}
