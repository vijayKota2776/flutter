import 'package:flutter_test/flutter_test.dart';
import 'package:flower_app/main.dart';

void main() {
  testWidgets('Flower app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlowerApp());
  });
}
