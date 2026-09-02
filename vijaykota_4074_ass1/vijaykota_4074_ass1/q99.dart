abstract class Serializable {}

class Product implements Serializable {
  String name;
  double price;

  Product(this.name, this.price);
}

void main() {
  Product p = Product('Laptop', 999.99);
  if (p is Serializable) {
    print('${p.name} is serializable');
  }
}
