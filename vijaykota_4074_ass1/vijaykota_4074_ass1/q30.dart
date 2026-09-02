class Demo {
  int x;
  int y;

  Demo() : x = 0, y = 0;
  Demo.parameterized(this.x, this.y);

  void show() {
    print('x: $x, y: $y');
  }
}

void main() {
  Demo d1 = Demo();
  Demo d2 = Demo.parameterized(10, 20);

  d1.show();
  d2.show();
}
