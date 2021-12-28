import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/controller/auth_controller.dart';
import 'package:memo_sample/presentation/page/memo_list_page.dart';
import 'package:memo_sample/presentation/page/sign_in_page.dart';

class AuthGate extends HookConsumerWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasAlreadyLoggedIn = ref.watch(hasAlreadyLoggedInProvider);
    return hasAlreadyLoggedIn.when(
      data: (value) {
        if (!value) {
          return const SingInPage();
        }
        return const MemoListPage();
      },
      error: (error, __) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
