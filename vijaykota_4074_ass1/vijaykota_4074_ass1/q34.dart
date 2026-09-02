class BankAccount {
  double _balance;

  BankAccount(this._balance);

  double get balance => _balance;

  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    } else {
      print('Invalid balance amount');
    }
  }
}

void main() {
  BankAccount account = BankAccount(500.0);
  print('Current balance: ${account.balance}');

  account.balance = 1000.0;
  print('Updated balance: ${account.balance}');

  account.balance = -200.0;
}
