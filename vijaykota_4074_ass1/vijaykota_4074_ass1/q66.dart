mixin Playable {
  void play() {
    print('Playing instrument');
  }
}

class Guitar with Playable {}
class Piano with Playable {}

void main() {
  Guitar g = Guitar();
  Piano p = Piano();

  g.play();
  p.play();
}
