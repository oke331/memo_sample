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
          onPressed: () => Navigator.pop(context),
          child: Text(
            S.of(context).cancel,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ref.read(memoControllerProvider).delete(memoId: memoId);
            final exception =
                ref.read(memoControllerExceptionProvider.notifier).state;
            if (exception != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(exception.toString())),
              );
              return;
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context).deleteSuccessfully)),
            );
            Navigator.pop(context);
          },
          child: Text(
            S.of(context).delete,
            style: const TextStyle(color: ConstantColor.warningColor),
          ),
        )
      ],
    );
  }
}
