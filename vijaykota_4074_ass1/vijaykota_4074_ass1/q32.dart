class Point {
  int x;
  int y;

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void printPoint() {
    print('Point(${this.x}, ${this.y})');
  }
}

void main() {
  Point p = Point(5, 10);
  p.printPoint();
}
