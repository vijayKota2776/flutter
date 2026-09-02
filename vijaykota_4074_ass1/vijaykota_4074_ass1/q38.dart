class A {
  A() {
    print('Constructor A');
  }
}

class B extends A {
  B() {
    print('Constructor B');
  }
}

class C extends B {
  C() {
    print('Constructor C');
  }
}

void main() {
  C obj = C();
}
