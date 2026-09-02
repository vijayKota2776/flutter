class Parent {
  String msg;

  Parent(this.msg);

  void display() {
    print('Parent message: $msg');
  }
}

class Child extends Parent {
  Child(String msg) : super(msg);

  @override
  void display() {
    super.display();
    print('Child display method');
  }
}

void main() {
  Child c = Child('Hello Parent');
  c.display();
}
