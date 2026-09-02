void main() {
  int year = 2024;
  bool isLeap = (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);

  if (isLeap) {
    print('$year is a leap year');
  } else {
    print('$year is not a leap year');
  }
}
