abstract class Machine {
  void operate();
}

mixin Maintainable {
  void service() {
    print('Performing maintenance');
  }
}

class Robot extends Machine with Maintainable {
  @override
  void operate() {
    print('Robot working');
  }
}

void main() {
  Robot bot = Robot();
  bot.operate();
  bot.service();
}
