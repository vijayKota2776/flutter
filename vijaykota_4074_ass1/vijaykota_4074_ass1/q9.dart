void main() {
  final double pi = 3.14159;
  double r = 5.0;
  double l = 4.0, w = 6.0;
  double b = 3.0, h = 8.0;

  double circleArea = pi * r * r;
  double rectArea = l * w;
  double triangleArea = 0.5 * b * h;

  print('Circle area: $circleArea');
  print('Rectangle area: $rectArea');
  print('Triangle area: $triangleArea');
}
