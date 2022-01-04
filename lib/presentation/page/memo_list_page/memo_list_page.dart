import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/page/memo_list_page/memo_list_body.dart';
import 'package:memo_sample/router.dart';

class MemoListPage extends HookConsumerWidget {
  const MemoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).memoListName),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => ref.read(routerProvider).go('/setting'),
          )
        ],
      ),
      body: const MemoListBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => ref.read(routerProvider).go('/create'),
      ),
    );
  }
}
