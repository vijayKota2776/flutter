class Animal {}
class Dog extends Animal {}

class Parent {
  Animal getAnimal() => Animal();
}

class Child extends Parent {
  @override
  Dog getAnimal() => Dog();
}

void main() {
  Child c = Child();
  print(c.getAnimal().runtimeType);
}
