import 'package:flutter_test/flutter_test.dart';
import 'package:conceptlab/main.dart';

void main() {
  testWidgets('CONCEPTLAB premium home renders', (WidgetTester tester) async {
    await tester.pumpWidget(const ConceptLabApp());

    expect(find.text('CONCEPTLAB'), findsOneWidget);
    expect(find.text('Discover how the'), findsOneWidget);
    expect(find.text('Pick up where you left off'), findsOneWidget);
  });

  testWidgets('navigation opens the interactive lab', (WidgetTester tester) async {
    await tester.pumpWidget(const ConceptLabApp());

    await tester.tap(find.text('Lab').last);
    await tester.pump();

    expect(find.text('Your virtual lab starts here.'), findsOneWidget);
    expect(find.text('Free-fall explorer'), findsOneWidget);
  });
}
