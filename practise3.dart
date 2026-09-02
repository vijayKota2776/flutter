class Student{

  int? id;
  String? name;
  String? course;

  void setID(int id){
    this.id = id;
  }

  void setName(String name){
    this.name = name;
  }

  void setCourse(String course){
    this.course = course;
  }
  
  int? getID(){
    return this.id;
  }

  String? getName(){
    return this.name;
  }

  String? getCourse(){
    return this.course;
  }

}

void main() {

  Student s = Student();
  s.id = 1;
  s.name = "Amitabh";
  s.course = "Dart";

  print("My name is ${s.name}, my course is ${s.course} and my id is ${s.id}");
  
}