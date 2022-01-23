import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/infrastructure/repository/memo_repository.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';
import 'package:memo_sample/presentation/controller/memo_controller/memo_controller.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/generate_mocks.mocks.dart';
import '../../mocks/mocks.dart';

void main() {
  group('[memoProvider]', () {
    group('when the memoId is set to null', () {
      test('return null', () async {
        const settingValue = null;
        final container = ProviderContainer(overrides: [
          memoRepositoryProvider.overrideWithValue(MockMemoRepository()),
        ]);

        expect(
          container.read(memoProvider(settingValue)),
          const AsyncValue<Memo?>.loading(),
        );

        await container.read(memoProvider(settingValue).future);

        expect(
          container.read(memoProvider(settingValue)),
          const AsyncData<Memo?>(null),
        );
      });
    });

    group('when the memoId is set to "1" and the userId is set to "test"', () {
      test('return Memo object', () async {
        const settingValue = '1';
        final result = MockMemo();

        final mockMemoRepository = MockMemoRepository();
        when(
          mockMemoRepository.fetchMemo(
            userId: anyNamed('userId'),
            memoId: anyNamed('memoId'),
          ),
        ).thenAnswer((_) async => result);

        final mockUser = MockUser();
        when(mockUser.uid).thenReturn('test');
        final mockAuthState = MockAuthState();
        when(mockAuthState.firebaseUser).thenReturn(AsyncData(mockUser));
        final mockAuthController = MockAuthController(mockAuthState);

        final container = ProviderContainer(overrides: [
          memoRepositoryProvider.overrideWithValue(mockMemoRepository),
          authControllerProvider.overrideWithValue(mockAuthController),
        ]);

        expect(
          container.read(memoProvider(settingValue)),
          const AsyncValue<Memo?>.loading(),
        );

        await container.read(memoProvider(settingValue).future);

        expect(
          container.read(memoProvider(settingValue)),
          AsyncData<Memo?>(result),
        );
      });
    });
  });
}
