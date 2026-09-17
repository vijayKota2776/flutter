class CollegeModel{
  int id;
  String name;
  String description;
  String location;
  int star;

  CollegeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.star,
  });

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'star': star,
    };
  }

  factory CollegeModel.fromMap(Map<String,dynamic> map){
    return CollegeModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      location: map['location'],
      star: map['star'],
    );
  }


}