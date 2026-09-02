mixin Flyable {
  void fly() => print('Flying high');
}

mixin Eatable {
  void eat() => print('Eating food');
}

class Duck with Flyable, Eatable {}

void main() {
  Duck d = Duck();
  d.fly();
  d.eat();
}
