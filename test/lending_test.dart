import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lending_shameen/main.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}){
    return MaterialApp(
      home: child,
    );
  }

  group("Lending screen test", () {
    testWidgets('KnowMoreBox Test', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: new LendingPage()));

      expect(find.text('Know More'), findsOneWidget);

      expect(find.byType(Checkbox), findsOneWidget);

      final finderShowMore = find.byWidgetPredicate(
            (widget) => widget is RichText && tapTextSpan(widget, " Read More "),
      );

      final finderShowLess = find.byWidgetPredicate(
            (widget) => widget is RichText && tapTextSpan(widget, " Read Less "),
      );

      // Verify that our counter starts at 0.
      expect(finderShowMore, findsOneWidget);
      expect(finderShowLess, findsNothing);

      await tester.tap(find.byKey(const Key('btnUnlock')));
      await tester.pump();

      expect(find.text('Unlock and sign up to withdraw the funds to your bank account.'), findsOneWidget);


    });

    testWidgets('UnlockBox Test', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: new LendingPage()));

      expect(find.text('UNLOCK UP TO'), findsOneWidget);
      expect(find.text('₹ 10,00,000'), findsOneWidget);
      expect(find.text('IN QUICK 4 STEPS'), findsOneWidget);

      final widgetRectangle = find.byType(Image);
      await tester.pumpAndSettle();
      expect(widgetRectangle, findsNWidgets(3));

    });
  });
}

bool findTextAndTap(InlineSpan visitor, String text) {
  if (visitor is TextSpan && visitor.text == text) {
    (visitor.recognizer as TapGestureRecognizer).onTap?.call();

    return false;
  }

  return true;
}

bool tapTextSpan(RichText richText, String text) {
  final isTapped = !richText.text.visitChildren(
        (visitor) => findTextAndTap(visitor, text),
  );

  return isTapped;
}
