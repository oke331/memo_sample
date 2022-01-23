import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/infrastructure/provider/firebase_provider.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';
import 'package:memo_sample/presentation/page/memo_list_page/memo_list_page.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/generate_mocks.mocks.dart';
import '../../mocks/mocks.dart';
import '../widget_test_helper.dart';

void main() {
  group('[MemoListBody]', () {
    group('when memo list is empty', () {
      // limitメソッドが実装されていないためエラーが出る。
      // このテストは一旦パスする。
      // See also: https://github.com/atn832/fake_cloud_firestore/issues/198
      testWidgets('show empty text', (tester) async {
        final firestore = FakeFirebaseFirestore();
        final mockUser = MockUser(uid: 'test');
        final mockAuthState = MockAuthState();
        when(mockAuthState.firebaseUser).thenReturn(AsyncData(mockUser));
        final mockAuthController = MockAuthController(mockAuthState);
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              firebaseFirestoreProvider.overrideWithValue(firestore),
              authControllerProvider.overrideWithValue(mockAuthController),
            ],
            child: wrapWithMaterial(
              const MemoListPage(),
            ),
          ),
        );
        await tester.idle();
        await tester.pump();
        expect(find.text('No data.'), findsOneWidget);
      }, skip: true);
    });
  });
}
