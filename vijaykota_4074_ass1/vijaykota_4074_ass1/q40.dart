class Parent {
  void show() {
    print('Parent class');
  }
}

class Child extends Parent {
  @override
  void show() {
    print('Child class');
  }
}

void main() {
  Parent obj = Child();
  obj.show();
}
