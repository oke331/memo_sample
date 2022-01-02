import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/memo_edit_body.dart';
import 'package:memo_sample/router.dart';

class MemoDetailPage extends ConsumerWidget {
  const MemoDetailPage({
    Key? key,
    required this.memoId,
  }) : super(key: key);

  final String memoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).memoDetailName),
        actions: [
          TextButton(
            onPressed: () => ref.read(routerProvider).go('/$memoId/edit'),
            child: Text(S.of(context).edit),
          ),
        ],
      ),
      body: const MemoEditBody(),
    );
  }
}
