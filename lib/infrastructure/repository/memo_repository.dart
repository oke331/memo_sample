import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/extension.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/infrastructure/provider/firebase_provider.dart';

final memoRepositoryProvider =
    Provider<MemoRepository>((ref) => MemoRepository._(ref.read));

class MemoRepository {
  const MemoRepository._(this._read);
  final Reader _read;

  FirebaseFirestore get _firebaseFirestore => _read(firebaseFirestoreProvider);

  Future<Memo> fetchMemo({
    required String userId,
    required String memoId,
  }) async {
    final result = await _firebaseFirestore.memosRef(userId).doc(memoId).get();
    return Memo.fromDocumentSnapshot(result);
  }

  Future<DocumentReference> add({
    required String userId,
    required String title,
    required String text,
  }) async {
    return _firebaseFirestore.memosRef(userId).add({
      MemoField.title: title,
      MemoField.text: text,
      MemoField.createdAt: FieldValue.serverTimestamp(),
      MemoField.updatedAt: FieldValue.serverTimestamp(),
    });
  }

  Future<void> update({
    required String userId,
    required String memoId,
    required String title,
    required String text,
  }) async {
    await _firebaseFirestore.memosRef(userId).doc(memoId).update({
      MemoField.title: title,
      MemoField.text: text,
      MemoField.updatedAt: FieldValue.serverTimestamp(),
    });
  }

  Future<void> delete({
    required String userId,
    required String memoId,
  }) async {
    await _firebaseFirestore.memosRef(userId).doc(memoId).delete();
  }
}
