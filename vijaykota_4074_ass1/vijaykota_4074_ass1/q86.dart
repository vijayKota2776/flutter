abstract class Base {
  final void log() {
    print('Base logging');
  }
}

class Sub extends Base {}

void main() {
  Sub s = Sub();
  s.log();
}
