class A{
  void apple(){
    print("Class A");
  }
}

class B extends A{
  void apple(){
    print("Class B");
  }
}

class C extends B{
  void apple(){
    print("Class C");
  }
}

void main(){
  A a = A();
  B b = B();
  C c = C();

  a.apple();
  b.apple();
  c.apple();
}