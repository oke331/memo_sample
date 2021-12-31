import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/util/date_time_formatter.dart';

class MemoListTile extends HookConsumerWidget {
  const MemoListTile({
    Key? key,
    required this.memo,
  }) : super(key: key);

  final Memo memo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () {},
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
