import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_widget_gallery/main.dart';

void main() {
  testWidgets('Home screen lists sections and filters by search', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Widget Gallery'), findsWidgets);
    expect(find.text('Expanded'), findsOneWidget);

    await tester.enterText(find.byType(SearchBar), 'stepper');
    await tester.pump();

    expect(find.text('Stepper'), findsOneWidget);
    expect(find.text('Expanded'), findsNothing);
  });

  testWidgets('Tapping a tile opens the example screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Expanded'));
    await tester.pumpAndSettle();

    expect(find.text('LIVE DEMO'), findsOneWidget);
    expect(find.text('lib/widgets/expanded_widget.dart'), findsOneWidget);
  });
}
