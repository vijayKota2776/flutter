class Rectangle {
  double length;
  double width;

  Rectangle(this.length, this.width);

  double area() => length * width;
  double perimeter() => 2 * (length + width);
}

void main() {
  Rectangle rect = Rectangle(5.0, 3.0);
  print('Area: ${rect.area()}');
  print('Perimeter: ${rect.perimeter()}');
}
