import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';
import 'package:memo_sample/router.dart';

import '../../constant_color.dart';

class LogoutDialog extends HookConsumerWidget {
  const LogoutDialog({Key? key}) : super(key: key);

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
          onPressed: ref.read(authControllerProvider.notifier).signOut,
          child: const Text(
            '削除',
            style: TextStyle(color: ConstantColor.warningColor),
          ),
        )
      ],
    );
  }
}
