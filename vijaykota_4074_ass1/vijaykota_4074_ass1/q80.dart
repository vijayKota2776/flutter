mixin Resizable {
  void resize(double factor) {
    print('Resized by factor $factor');
  }
}

class Rectangle with Resizable {}

void main() {
  Rectangle r = Rectangle();
  r.resize(1.5);
}
