abstract class Drawable {
  void draw();
}

class Circle implements Drawable {
  @override
  void draw() {
    print('Drawing Circle');
  }
}

class Square implements Drawable {
  @override
  void draw() {
    print('Drawing Square');
  }
}

void main() {
  Drawable d1 = Circle();
  Drawable d2 = Square();

  d1.draw();
  d2.draw();
}
