import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nav/main.dart';

void main() {
  testWidgets('App renders login screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PhilippineCinemaApp());
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
