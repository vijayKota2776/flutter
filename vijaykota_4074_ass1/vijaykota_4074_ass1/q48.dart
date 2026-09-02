mixin Logger {
  void log(String msg) {
    print('LOG: $msg');
  }
}

class Service with Logger {
  void execute() {
    log('Service executed successfully');
  }
}

void main() {
  Service s = Service();
  s.execute();
}
