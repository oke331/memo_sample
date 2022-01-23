import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/presentation/controller/memo_controller/memo_controller.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/edit_text_section.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/edit_title_section.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/memo_edit_page.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/generate_mocks.mocks.dart';
import '../widget_test_helper.dart';

void main() {
  group('[MemoEditPage]', () {
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
            child: wrapWithMaterial(MemoEditPage()),
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

    group('when memoProvider has no object', () {
      testWidgets('show TextField and save icon', (tester) async {
        final mockMemoProvider =
            FutureProvider.family.autoDispose<Memo?, String?>(
          (_, __) => Future(() => null),
        );
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              memoProvider.overrideWithProvider(mockMemoProvider),
            ],
            child: wrapWithMaterial(MemoEditPage()),
          ),
        );

        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byIcon(Icons.save), findsNothing);

        await tester.pumpAndSettle();
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byIcon(Icons.save), findsOneWidget);
        expect(find.byType(EditTitleSection), findsOneWidget);
        expect(find.byType(EditTextSection), findsOneWidget);
      });
    });

    group('when memoProvider has Memo object', () {
      testWidgets('show memo and save icon', (tester) async {
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
            child: wrapWithMaterial(MemoEditPage()),
          ),
        );

        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byIcon(Icons.save), findsNothing);

        await tester.pumpAndSettle();
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byIcon(Icons.save), findsOneWidget);
        expect(find.text(title), findsOneWidget);
        expect(find.text(text), findsOneWidget);
      });
    });

    group('when not input text', () {
      testWidgets('show required text', (tester) async {
        final mockMemoProvider =
            FutureProvider.family.autoDispose<Memo?, String?>(
          (_, __) => Future(() => null),
        );
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              memoProvider.overrideWithProvider(mockMemoProvider),
            ],
            child: wrapWithMaterial(MemoEditPage()),
          ),
        );
        await tester.pump();
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.save));
        await tester.pump();
        expect(find.text('Required'), findsOneWidget);
        expect(
          find.text('There is an error in the input content.'),
          findsOneWidget,
        );
      });
    });

    group('when input correctly words', () {
      testWidgets('show successfully text', (tester) async {
        final mockMemoProvider =
            FutureProvider.family.autoDispose<Memo?, String?>(
          (_, __) => Future(() => null),
        );
        final mockMemoController = MockMemoController();
        when(mockMemoController.add(
          title: anyNamed('title'),
          text: anyNamed('text'),
        )).thenAnswer((_) async => '');
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              memoControllerProvider.overrideWithValue(mockMemoController),
              memoProvider.overrideWithProvider(mockMemoProvider),
            ],
            child: wrapWithMaterial(MemoEditPage()),
          ),
        );
        await tester.pump();
        await tester.pumpAndSettle();

        await tester.enterText(
          find.byKey(EditTextSection.textFormFieldKey),
          'test',
        );

        await tester.tap(find.byIcon(Icons.save));
        await tester.pump();
        expect(find.text('Save Successfully!'), findsOneWidget);
      });
    });
  });
}
