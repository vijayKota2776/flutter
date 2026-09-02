void main() {
  int a = 12, b = 45, c = 32, d = 78;
  int max;

  if (a >= b) {
    if (a >= c) {
      if (a >= d) {
        max = a;
      } else {
        max = d;
      }
    } else {
      if (c >= d) {
        max = c;
      } else {
        max = d;
      }
    }
  } else {
    if (b >= c) {
      if (b >= d) {
        max = b;
      } else {
        max = d;
      }
    } else {
      if (c >= d) {
        max = c;
      } else {
        max = d;
      }
    }
  }

  print('Maximum is $max');
}
