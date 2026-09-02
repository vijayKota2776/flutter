import 'package:employee_crud_app/services/employee_service.dart';
import 'package:flutter/material.dart';
import '../models/employee.dart';

class EmployeeListScreen extends StatefulWidget {
  EmployeeListScreenState createState() =>EmployeeListScreenState();

}


class EmployeeListScreenState extends State<EmployeeListScreen>{
  List <Employee>employees=[];
  void loadEmployee(){
    setState(() {
      employees=EmployeeService.find();
    });
    }
  void initState(){
    super.initState();
    loadEmployee();

  }
  void handleDelete(int id){
    EmployeeService.findByIdAndDelete(id);
    loadEmployee();
  }


  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(title: Text("Employee List Screen")),
      body:ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context,index){
          Employee employee =employees[index];
          return ListTile(
            title: Text(employee.name),
            subtitle: Text(employee.email),
            trailing: Row(mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: ()=>{handleDelete(employee.id)},
               icon: Icon(Icons.delete)),

               IconButton(onPressed: ()=>{Navigator.pushNamed(
                (context), '/employee-view-detail', 
                arguments: Employee(id: employee.id, name: employee.name, userName: employee.userName, email: employee.email, 
                password: employee.password, role: employee.role, salary: employee.salary))}, icon: Icon(Icons.visibility))
            ] ,),
          );
        }
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){ Navigator.pushNamed(context, "/add-employee");
        }),

      );
    
  }
}