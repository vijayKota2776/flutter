import '../models/employee.dart';

class EmployeeService {
  static List<Employee> employees = [
    Employee(
      id: 1,
      name: "Siva",
      email: "siva@example.com",
      password: "password123", userName: '', role: '', salary: '',
    ),
    Employee(
      id: 2,
      name: "Anita",
      email: "anita@example.com",
      password: "password123",
      userName: 'anita',
      role: 'Employee',
      salary: '50000',
    ),
    Employee(
      id: 3,
      name: "Rahul",
      email: "rahul@example.com",
      password: "password123",
      userName: 'rahul',
      role: 'Employee',
      salary: '50000',
    ),
    Employee(
      id: 4,
      name: "Priya",
      email: "priya@example.com",
      password: "password123",
      userName: 'priya',
      role: 'Employee',
      salary: '50000',
    ),
    Employee(
      id: 5,
      name: "Arjun",
      email: "arjun@example.com",
      password: "password123",
      userName: '',
      role: '',
      salary: '',
    ),
  ];

  static List<Employee> find() {
    return employees;
    
    
  }

  static void findByIdAndDelete(int id){
    employees.removeWhere((employees) => employees.id == id);
  }
}