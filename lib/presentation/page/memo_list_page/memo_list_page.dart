import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/router.dart';

class MemoListPage extends ConsumerWidget {
  const MemoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メモリスト'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => ref.read(routerProvider).go('/setting'),
          )
        ],
      ),
    );
  }
}
