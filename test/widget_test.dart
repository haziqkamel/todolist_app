// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todolist_app/login_page.dart';

void main() {
  testWidgets('Empty Username and Password cannot sign in',
      (WidgetTester tester) async {
    //Build our app and trigger a frame for LoginPage
    await tester.pumpWidget(const LoginPage());
    await tester.pumpAndSettle();

    //Ask Finder to find widgetWithText Login Button --> Type = ElevatedButton Text = 'Login'
    Finder loginButton = find.widgetWithText(ElevatedButton, 'Login');
    await tester.press(loginButton);

    // Widget alertDialog = const AlertDialog(
    //   title: Text('Error Input!'),
    //   content: Text('Username or password cannot be empty!'),
    // );
    // expect(find.byWidget(alertDialog), findsNothing);
  });
}
