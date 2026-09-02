abstract class Shape {
  void draw();
}

class Triangle extends Shape {
  @override
  void draw() => print('Drawing Triangle');
}

class Circle extends Shape {
  @override
  void draw() => print('Drawing Circle');
}

void main() {
  List<Shape> shapes = [Triangle(), Circle()];
  for (var shape in shapes) {
    shape.draw();
  }
}
