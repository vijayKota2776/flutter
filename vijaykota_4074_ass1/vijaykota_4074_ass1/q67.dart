mixin DefaultLogger {
  void logInfo(String info) {
    print('INFO: $info');
  }
}

class App with DefaultLogger {
  void run() {
    logInfo('App started');
  }
}

void main() {
  App app = App();
  app.run();
}
