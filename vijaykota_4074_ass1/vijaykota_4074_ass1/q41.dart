class Shape {
  void draw() {
    print('Generic Shape');
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print('Circle shape');
  }
}

class Rectangle extends Shape {
  @override
  void draw() {
    print('Rectangle shape');
  }
}

void main() {
  List<Shape> shapes = [Circle(), Rectangle(), Shape()];

  for (var shape in shapes) {
    shape.draw();
  }
}
