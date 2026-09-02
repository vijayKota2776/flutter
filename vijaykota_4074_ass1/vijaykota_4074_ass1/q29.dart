class Box {
  double length;
  double breadth;
  double height;

  Box(this.length, this.breadth, this.height);

  double volume() {
    return length * breadth * height;
  }
}

void main() {
  Box b = Box(3.0, 4.0, 5.0);
  print('Volume of box: ${b.volume()}');
}
