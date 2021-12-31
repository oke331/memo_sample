import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';

class MemoListBody extends HookConsumerWidget {
  const MemoListBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref
        .watch(authControllerProvider.select((value) => value.firebaseUser))
        .value!
        .uid;
    return FirestoreListView<Memo>(
      query: FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('memos')
          .orderBy('updatedAt')
          .withConverter<Memo>(
            fromFirestore: (snapshot, _) => Memo.fromDocumentSnapshot(snapshot),
            toFirestore: (obj, _) => obj.toJson(),
          ),
      itemBuilder: (context, snapshot) {
        final memo = snapshot.data();
        return ListTile(
          title: Text(
            memo.title.isNotEmpty ? memo.title : memo.text,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
