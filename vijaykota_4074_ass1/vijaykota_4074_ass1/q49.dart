mixin Printable {
  void printData() {
    print('Printing data');
  }
}

mixin Showable {
  void showData() {
    print('Showing data');
  }
}

class Document with Printable, Showable {}

void main() {
  Document doc = Document();
  doc.printData();
  doc.showData();
}
