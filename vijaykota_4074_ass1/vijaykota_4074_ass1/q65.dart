abstract class Bird {
  void fly() {
    print('Bird is flying');
  }
  void makeSound();
}

class Sparrow extends Bird {
  @override
  void makeSound() {
    print('Chirp chirp');
  }
}

void main() {
  Sparrow s = Sparrow();
  s.fly();
  s.makeSound();
}
