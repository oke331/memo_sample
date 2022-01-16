import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memo_sample/util/timestamp_converter.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
class Memo with _$Memo {
  const factory Memo({
    required String id,
    @Default('') String title,
    required String text,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);

  factory Memo.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data()! as Map<String, dynamic>;
    if (documentSnapshot.metadata.hasPendingWrites) {
      data.update(MemoField.createdAt, (value) => Timestamp.now());
      data.update(MemoField.updatedAt, (value) => Timestamp.now());
    }
    return Memo.fromJson({
      MemoField.id: documentSnapshot.id,
      ...data,
    });
  }
}

class MemoField {
  static const id = 'id';
  static const title = 'title';
  static const text = 'text';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
}
