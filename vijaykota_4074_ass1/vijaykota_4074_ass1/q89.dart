class Singleton {
  static final Singleton _instance = Singleton._internal();

  Singleton._internal();

  static Singleton get instance => _instance;
}

void main() {
  Singleton s1 = Singleton.instance;
  Singleton s2 = Singleton.instance;

  print(identical(s1, s2));
}
