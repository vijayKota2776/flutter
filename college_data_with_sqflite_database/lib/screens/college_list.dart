import 'package:college_data_with_sqflite_database/services/sqflite_db_service.dart';
import 'package:flutter/material.dart';
import '../models/college.dart';

class CollegeListScreen extends StatefulWidget {
  @override
  CollegeListScreenState createState() => CollegeListScreenState();
}

class CollegeListScreenState extends State<CollegeListScreen> {
  List<CollegeModel> colleges = [];

  void loadCollegeData() async {
    final data = await DbService.instance.getAllColleges();
    setState(() {
      colleges=data;
    });
  }

  @override
  void initState() {
  super.initState();
  loadCollegeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('College List'),
      ),
      body: ListView.builder(
        itemCount: colleges.length,
        itemBuilder: (context, index) {
          CollegeModel college = colleges[index];
          return ListTile(
            title: Text(college.name),
            subtitle: Text(college.location),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(college.star.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}