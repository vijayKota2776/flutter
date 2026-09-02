class Complex {
  double real;
  double imag;

  Complex(this.real, this.imag);
  Complex.realOnly(double r) : real = r, imag = 0.0;
  Complex.imagOnly(double i) : real = 0.0, imag = i;

  void display() {
    print('$real + ${imag}i');
  }
}

void main() {
  Complex c1 = Complex(3, 4);
  Complex c2 = Complex.realOnly(5);
  Complex c3 = Complex.imagOnly(2);

  c1.display();
  c2.display();
  c3.display();
}
