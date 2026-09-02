class MathUtils {
  static const double pi = 3.14159;

  static double square(double num) {
    return num * num;
  }
}

void main() {
  print('PI: ${MathUtils.pi}');
  print('Square of 5: ${MathUtils.square(5)}');
}
