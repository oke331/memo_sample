import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/page/memo_edit_page/memo_edit_body.dart';

class MemoEditPage extends ConsumerWidget {
  const MemoEditPage({
    Key? key,
    this.memoId,
  }) : super(key: key);

  final String? memoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).memoEditName),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(S.of(context).save),
          ),
        ],
      ),
      body: const MemoEditBody(),
    );
  }
}
