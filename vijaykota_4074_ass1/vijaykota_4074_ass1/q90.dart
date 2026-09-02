void printUser({String name = 'Guest', int roleId = 1}) {
  print('User: $name, Role: $roleId');
}

void main() {
  printUser();
  printUser(name: 'Admin', roleId: 99);
}
