import 'package:flutter/material.dart';
import 'package:employee_crud_app/models/employee.dart';

class EmployeeViewDetailScreen extends StatefulWidget{
  EmployeeViewDetailScreeState createState()=>EmployeeViewDetailScreeState();
}

class EmployeeViewDetailScreeState extends State<EmployeeViewDetailScreen> {
  Widget build(BuildContext context){
    Employee employee = ModalRoute.of(context)!.settings.arguments as Employee;

    return Scaffold(
      appBar: AppBar(title: Text("Employee Detail View")),
      body: Column(
        children: [
          Text(employee.name),
          Text(employee.userName),
          Text(employee.email),
          Text(employee.password),
          Text(employee.role),
          Text(employee.salary),
          

        ],
    )
      
      

    );
  }

}