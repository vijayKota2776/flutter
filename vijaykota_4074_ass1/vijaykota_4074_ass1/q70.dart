class User {
  int _age = 0;

  int get age => _age;

  set age(int value) {
    if (value >= 0 && value <= 120) {
      _age = value;
    } else {
      print('Invalid age');
    }
  }
}

void main() {
  User user = User();
  user.age = 25;
  print('User age: ${user.age}');

  user.age = 150;
}
