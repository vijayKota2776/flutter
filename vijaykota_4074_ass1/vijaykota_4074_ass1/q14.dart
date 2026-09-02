void main() {
  String ch = 'E';

  switch (ch.toLowerCase()) {
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
      print('Vowel');
      break;
    default:
      print('Consonant');
  }
}
