import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/infrastructure/repository/memo_repository.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';

final memoControllerProvider = Provider((ref) {
  final user =
      ref.watch(authControllerProvider.select((value) => value.firebaseUser));
  return MemoController._(ref.read, user.value?.uid);
});

final memoControllerExceptionProvider = StateProvider<Exception?>((_) => null);

final memoProvider =
    FutureProvider.family.autoDispose<Memo, String>((ref, memoId) async {
  final user =
      ref.watch(authControllerProvider.select((value) => value.firebaseUser));
  return ref.read(memoRepositoryProvider).fetchMemo(
        userId: user.value!.uid,
        memoId: memoId,
      );
});

class MemoController {
  MemoController._(this._read, this._userId);

  final Reader _read;
  final String? _userId;

  MemoRepository get _memoRepository => _read(memoRepositoryProvider);

  Future<void> add({
    required String title,
    required String text,
  }) async {
    try {
      await _memoRepository.add(
        userId: _userId!,
        title: title,
        text: text,
      );
    } on Exception catch (e) {
      _read(memoControllerExceptionProvider.notifier).state = e;
    }
  }

  Future<void> update({
    required String memoId,
    required String title,
    required String text,
  }) async {
    try {
      await _memoRepository.update(
        userId: _userId!,
        memoId: memoId,
        title: title,
        text: text,
      );
    } on Exception catch (e) {
      _read(memoControllerExceptionProvider.notifier).state = e;
    }
  }

  Future<void> delete({required String memoId}) async {
    try {
      await _memoRepository.delete(
        userId: _userId!,
        memoId: memoId,
      );
    } on Exception catch (e) {
      _read(memoControllerExceptionProvider.notifier).state = e;
    }
  }
}
