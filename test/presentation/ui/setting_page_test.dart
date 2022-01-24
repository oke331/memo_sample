import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';
import 'package:memo_sample/presentation/page/setting_page/logout_dialog.dart';
import 'package:memo_sample/presentation/page/setting_page/setting_page.dart';

import '../../mocks/generate_mocks.mocks.dart';
import '../../mocks/mocks.dart';
import '../widget_test_helper.dart';

void main() {
  group('[SettingPage]', () {
    group('tap logout button and display logout dialog', () {
      testWidgets('tap cancel button and hide dialog', (tester) async {
        await tester.pumpWidget(
          ProviderScope(child: wrapWithMaterial(const SettingPage())),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Logout'));
        await tester.pumpAndSettle();
        expect(find.byType(LogoutDialog), findsOneWidget);

        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();
        expect(find.byType(LogoutDialog), findsNothing);
      });

      testWidgets('tap Logout button and hide dialog', (tester) async {
        final mockAuthController = MockAuthController(MockAuthState());
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authControllerProvider.overrideWithValue(mockAuthController),
            ],
            child: wrapWithMaterial(const SettingPage()),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Logout'));
        await tester.pumpAndSettle();
        expect(find.byType(LogoutDialog), findsOneWidget);

        final firstCell = find.descendant(
          of: find.byType(TextButton),
          matching: find.text('Logout'),
        );
        await tester.tap(firstCell);
        await tester.pumpAndSettle();
        // routerの設定ができていないので確認できない
        // expect(find.byType(LogoutDialog), findsNothing);
        expect(find.text('Logout Successfully.'), findsOneWidget);
      });
    });
  });
}
