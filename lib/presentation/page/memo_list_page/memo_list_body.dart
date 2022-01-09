import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';

import 'memo_list_tile.dart';

final currentMemo = Provider<Memo>((_) => throw UnimplementedError());

class MemoListBody extends HookConsumerWidget {
  const MemoListBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref
        .watch(authControllerProvider.select((value) => value.firebaseUser))
        .value!
        .uid;
    return FirestoreQueryBuilder<Memo>(
      pageSize: 20,
      query: FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('memos')
          .orderBy('updatedAt')
          .withConverter<Memo>(
            fromFirestore: (snapshot, _) => Memo.fromDocumentSnapshot(snapshot),
            toFirestore: (obj, _) => obj.toJson(),
          ),
      builder: (context, snapshot, _) {
        if (snapshot.isFetching) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.docs.isEmpty) {
          return Center(child: Text(S.of(context).empty));
        }
        return ListView.builder(
          itemCount: snapshot.docs.length,
          itemBuilder: (context, index) {
            if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
              snapshot.fetchMore();
            }

            final memo = snapshot.docs[index].data();
            return ProviderScope(
              overrides: [currentMemo.overrideWithValue(memo)],
              child: const MemoListTile(),
            );
          },
        );
      },
    );
  }
}
