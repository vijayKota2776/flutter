abstract class Vehicle {
  void start();
}

class Car extends Vehicle {
  @override
  void start() {
    print('Car starting with key');
  }
}

class Bike extends Vehicle {
  @override
  void start() {
    print('Bike starting with kick');
  }
}

void main() {
  Vehicle car = Car();
  Vehicle bike = Bike();

  car.start();
  bike.start();
}
