import 'package:employee_crud_app/models/employee.dart';
import 'package:employee_crud_app/services/employee_service.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  AddEmployeeState createState()=> AddEmployeeState();
}

class AddEmployeeState extends State<AddEmployee>{
  TextEditingController nameController =TextEditingController();
  TextEditingController userNameController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController roleController =TextEditingController();
  TextEditingController salaryController =TextEditingController();
  TextEditingController emailController =TextEditingController();

  void handelSubmit(){
    Employee e= Employee(id:0, name: nameController.text, userName: userNameController.text, 
    email: emailController.text, password: passwordController.text, role: roleController.text, salary: salaryController.text);

    EmployeeService.addEmployee(e);
    Navigator.pop(context);
  }

  Widget build (BuildContext context){
    return Scaffold(
      appBar:AppBar(title:Text("ADD EMPLOYEE")),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Name"),

          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "NAME"),

          ),TextField(
            controller: userNameController,
            decoration: InputDecoration(labelText: "USERNAME"),

          ),TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: "EMAIL"),

          ),TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: "PASSWORD"),

          ),TextField(
            controller: roleController,
            decoration: InputDecoration(labelText: "ROLE"),

          ),TextField(
            controller: salaryController,
            decoration: InputDecoration(labelText: "SALARY"),

          ),
          TextButton(onPressed: handelSubmit, child: Text("ADD EMPLOYEE"))
        ],
        
      ),
    
  );
  }
}