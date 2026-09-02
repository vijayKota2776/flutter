class Level1 {
  void show() => print('Level 1');
}

class Level2 extends Level1 {
  @override
  void show() => print('Level 2');
}

class Level3 extends Level2 {
  @override
  void show() => print('Level 3');
}

void main() {
  Level1 obj = Level3();
  obj.show();
}
