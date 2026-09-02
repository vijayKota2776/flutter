import 'package:employee_crud_app/screen/add_employee.dart';
import 'package:employee_crud_app/screen/employee_list.dart';
import 'package:flutter/material.dart';
import 'package:employee_crud_app/screen/employee_view_detail.dart';

void main(){
  runApp(app());
}

class app extends StatelessWidget{
  Widget build (BuildContext context){
    return MaterialApp(
      title:"Employee CRUD App",
      initialRoute: '/',
      routes:{
        '/':(context)=>EmployeeListScreen(),
        '/employee-view-detail':(context)=>EmployeeViewDetailScreen(),
        '/add_employee':(context) => AddEmployee(),
      }
    );
  }
}