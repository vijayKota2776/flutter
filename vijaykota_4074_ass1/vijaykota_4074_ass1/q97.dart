class Point {
  int x;
  int y;

  Point(this.x, this.y);
  Point.zero() : this(0, 0);
  Point.originX(int x) : this(x, 0);
}

void main() {
  Point p1 = Point.zero();
  Point p2 = Point.originX(5);

  print('p1: (${p1.x}, ${p1.y})');
  print('p2: (${p2.x}, ${p2.y})');
}
