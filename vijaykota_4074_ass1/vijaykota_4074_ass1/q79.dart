abstract class Shape3D {
  double area();
  double volume();
}

class Cube extends Shape3D {
  double side;

  Cube(this.side);

  @override
  double area() => 6 * side * side;

  @override
  double volume() => side * side * side;
}

void main() {
  Cube c = Cube(3.0);
  print('Area: ${c.area()}');
  print('Volume: ${c.volume()}');
}
