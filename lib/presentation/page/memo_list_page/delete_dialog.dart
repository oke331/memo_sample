import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/controller/memo_controller/memo_controller.dart';
import 'package:memo_sample/router.dart';

import '../../constant_color.dart';

class DeleteDialog extends HookConsumerWidget {
  const DeleteDialog({
    Key? key,
    required this.memoId,
  }) : super(key: key);

  final String memoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return AlertDialog(
      title: const Text('削除しますか？'),
      actions: [
        TextButton(
          onPressed: () => router.pop(context),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () =>
              ref.read(memoControllerProvider).delete(memoId: memoId),
          child: const Text(
            '削除',
            style: TextStyle(color: ConstantColor.warningColor),
          ),
        )
      ],
    );
  }
}
