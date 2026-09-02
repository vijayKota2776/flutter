void printCoords([int x = 0, int y = 0]) {
  print('X: $x, Y: $y');
}

void main() {
  printCoords();
  printCoords(10);
  printCoords(10, 20);
}
