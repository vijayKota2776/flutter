import 'dart:io';

void main() {
  int rows = 5;

  for (int i = 0; i < rows; i++) {
    int val = 1;
    for (int j = 0; j <= i; j++) {
      stdout.write('$val ');
      val = val * (i - j) ~/ (j + 1);
    }
    print('');
  }
}
