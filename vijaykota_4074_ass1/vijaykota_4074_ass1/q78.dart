class Animal {
  void sound() => print('Generic sound');
}

class Dog extends Animal {
  @override
  void sound() => print('Bark');
}

class Cat extends Animal {
  @override
  void sound() => print('Meow');
}

void main() {
  Animal a1 = Dog();
  Animal a2 = Cat();

  a1.sound();
  a2.sound();
}
