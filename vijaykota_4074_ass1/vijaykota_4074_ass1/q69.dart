abstract class Animal {
  void eat() => print('Animal eats');
}

mixin Pet {
  void play() => print('Pet plays');
}

class Dog extends Animal with Pet {}

void main() {
  Dog dog = Dog();
  dog.eat();
  dog.play();
}
