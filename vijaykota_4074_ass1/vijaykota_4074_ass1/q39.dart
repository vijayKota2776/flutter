class Shape {
  void draw() {
    print('Drawing shape');
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print('Drawing Circle');
  }
}

class Rectangle extends Shape {
  @override
  void draw() {
    print('Drawing Rectangle');
  }
}

void main() {
  Shape s1 = Circle();
  Shape s2 = Rectangle();

  s1.draw();
  s2.draw();
}
