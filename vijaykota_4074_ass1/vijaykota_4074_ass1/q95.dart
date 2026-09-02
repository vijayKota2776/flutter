class Parent {
  Object getValue() => 'Parent';
}

class Child extends Parent {
  @override
  String getValue() => 'Child';
}

void main() {
  Child c = Child();
  print(c.getValue());
}
