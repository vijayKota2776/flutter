void flexFunc(int req, [int opt = 0], {String name = 'default'}) {
  print('req: $req, opt: $opt, name: $name');
}

void main() {
  flexFunc(10);
  flexFunc(10, 20);
  flexFunc(10, 20, name: 'custom');
}
