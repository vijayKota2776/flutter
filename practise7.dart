abstract class Mobile{
// why abstract is written and will code still work if abstract removed
  void camera();
  void ram();
  void keypad();
  void storage();
}
  class Samsung extends Mobile{
    void camera(){
      print("Samsung_camera");
    }

    void ram(){
      print("Samsung_ram");
    }

    void keypad(){
      print("Samsung_keypad");
    }

    void storage(){
      print("Samsung_storage");
    }

}


void main(){

  Samsung s = Samsung();
  s.camera();

}