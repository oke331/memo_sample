import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';
import 'package:memo_sample/router.dart';

class LogoutDialog extends HookConsumerWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return AlertDialog(
      title: Text(S.of(context).logoutMessage),
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
            ref.read(authControllerProvider.notifier).signOut();
            router.go('/sign_in');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context).logoutSuccessfully)),
            );
          },
          child: Text(S.of(context).logout),
        )
      ],
    );
  }
}
