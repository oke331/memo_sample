import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/page/memo_list_page/memo_list_body.dart';
import 'package:memo_sample/util/date_time_formatter.dart';

import 'delete_dialog.dart';

class MemoListTile extends HookConsumerWidget {
  const MemoListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memo = ref.watch(currentMemo);
    return ListTile(
      title: Text(
        memo.title.isNotEmpty ? memo.title : memo.text,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        formatFromDateFormatString(
          dateTime: memo.updatedAt,
          formatString: 'YYYY/MM/dd hh:mm',
        ),
      ),
      trailing: Row(
        children: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => DeleteDialog(memoId: memo.id),
            ),
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
