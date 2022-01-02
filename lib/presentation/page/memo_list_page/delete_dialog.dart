import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
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
      title: Text(S.of(context).deleteMessage),
      actions: [
        TextButton(
          onPressed: () => router.pop(context),
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () =>
              ref.read(memoControllerProvider).delete(memoId: memoId),
          child: Text(
            S.of(context).delete,
            style: const TextStyle(color: ConstantColor.warningColor),
          ),
        )
      ],
    );
  }
}
