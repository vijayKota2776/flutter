mixin MathMixin {
  static int add(int a, int b) => a + b;
}

void main() {
  print(MathMixin.add(10, 20));
}
