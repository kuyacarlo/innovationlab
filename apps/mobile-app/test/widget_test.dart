// ANI-SABI — Basic smoke test.
// Verifies the app boots without errors.

import 'package:flutter_test/flutter_test.dart';
import 'package:til_hackathon/main.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const AniSabiApp());
    // The Home screen should display the app title.
    expect(find.textContaining('ANI-SABI'), findsOneWidget);
  });
}
