import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/controller/memo_controller/memo_controller.dart';
import 'package:memo_sample/presentation/page/memo_list_page/memo_list_body.dart';
import 'package:memo_sample/router.dart';
import 'package:memo_sample/util/date_time_formatter.dart';

import 'delete_dialog.dart';

class MemoListTile extends HookConsumerWidget {
  const MemoListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoId = ref.watch(memoListBodyProvider);
    final memo = ref.watch(memoProvider(memoId));
    if (memo == null) {
      return const SizedBox.shrink();
    }

    final router = ref.watch(routerProvider);
    return ListTile(
      onTap: () => ref.read(routerProvider).go('/detail/${memo.id}'),
      title: Text(
        memo.title.isNotEmpty ? memo.title : memo.text,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        formatFromDateFormatString(
          dateTime: memo.updatedAt,
          formatString: 'yyyy/MM/dd hh:mm',
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => router.go('/edit/${memo.id}'),
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => DeleteDialog(memoId: memo.id),
            ),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
