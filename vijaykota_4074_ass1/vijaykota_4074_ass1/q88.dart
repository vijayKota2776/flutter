class Parent {}
class Child extends Parent {}

void main() {
  Parent p = Child();

  if (p is Child) {
    print('p is an instance of Child');
  }
}
