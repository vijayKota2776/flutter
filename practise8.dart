mixin A{
  void showA(){
    print("A mixin");
  }
}

mixin B{
  void showB(){
    print("B mixin");
  }
}

class C with A, B{
  
}

void main(){

  C c = C();
  c.showA();
  c.showB();

}