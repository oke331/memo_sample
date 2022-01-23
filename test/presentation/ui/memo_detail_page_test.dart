import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/presentation/controller/memo_controller/memo_controller.dart';
import 'package:memo_sample/presentation/page/memo_detail_page/memo_detail_page.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/generate_mocks.mocks.dart';
import '../widget_test_helper.dart';

void main() {
  group('[MemoDetailPage]', () {
    group('when memoProvider has error', () {
      testWidgets('show error text', (tester) async {
        final mockMemoProvider =
            FutureProvider.family.autoDispose<Memo?, String?>(
          (_, __) => Future(() => throw Exception()),
        );
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              memoProvider.overrideWithProvider(mockMemoProvider),
            ],
            child: wrapWithMaterial(
              const MemoDetailPage(memoId: 'test'),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pumpAndSettle();
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(
          find.text(
              'The acquisition process failed. Please tap and retry again. \nError:Exception'),
          findsOneWidget,
        );
      });
    });

    group('when memoProvider has Memo object', () {
      testWidgets('show memo and edit icon', (tester) async {
        final mockMemo = MockMemo();
        const title = 'testTitle';
        const text = 'testText';
        when(mockMemo.title).thenReturn(title);
        when(mockMemo.text).thenReturn(text);

        final mockMemoProvider =
            FutureProvider.family.autoDispose<Memo?, String?>(
          (_, __) => Future(() => mockMemo),
        );
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              memoProvider.overrideWithProvider(mockMemoProvider),
            ],
            child: wrapWithMaterial(
              const MemoDetailPage(memoId: 'test'),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byIcon(Icons.edit), findsNothing);

        await tester.pumpAndSettle();
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byIcon(Icons.edit), findsOneWidget);
        expect(find.text(title), findsOneWidget);
        expect(find.text(text), findsOneWidget);
      });
    });
  });
}
