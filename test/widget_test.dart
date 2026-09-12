import 'package:flutter_test/flutter_test.dart';

import 'package:smart_educational/main.dart';

void main() {
  testWidgets('يعرض التطبيق شاشة البداية', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartEducationalApp());

    expect(find.text('المستشار التعليمي الذكي'), findsOneWidget);
    expect(find.text('Smart Educational Advisory'), findsOneWidget);
  });
}
