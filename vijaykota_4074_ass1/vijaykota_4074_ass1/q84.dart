class ImmutableData {
  final int id;

  ImmutableData(this.id);

  final void display() {
    print('ID: $id');
  }
}

void main() {
  ImmutableData data = ImmutableData(100);
  data.display();
}
