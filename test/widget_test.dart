import 'package:flutter_test/flutter_test.dart';

import 'package:smart_educational/app/app.dart';

void main() {
  testWidgets('renders the Arabic splash identity', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartEducationalApp());

    expect(find.text('المستشار التعليمي الذكي'), findsOneWidget);
  });
}
