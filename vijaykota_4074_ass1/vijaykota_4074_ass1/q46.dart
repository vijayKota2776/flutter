abstract class Appliance {
  void turnOn();

  void info() {
    print('This is an electrical appliance.');
  }
}

class Fan extends Appliance {
  @override
  void turnOn() {
    print('Fan spinning');
  }
}

void main() {
  Fan fan = Fan();
  fan.info();
  fan.turnOn();
}
