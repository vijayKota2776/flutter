class Car {
  String brand;
  String model;

  Car(this.brand, this.model);

  void display() {
    print('Car Brand: $brand, Model: $model');
  }
}

void main() {
  Car c1 = Car('Toyota', 'Camry');
  Car c2 = Car('Tesla', 'Model 3');

  c1.display();
  c2.display();
}
