import 'package:flutter_test/flutter_test.dart';
import 'package:conceptlab/main.dart';

void main() {
  testWidgets('CONCEPTLAB home screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const ConceptLabApp());

    expect(find.text('CONCEPTLAB'), findsOneWidget);
    expect(find.text('Discover how the\\nworld works.'), findsOneWidget);
    expect(find.text('Continue learning'), findsOneWidget);
  });
}
