import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';
import 'package:memo_sample/presentation/page/memo_list_page/memo_list_page.dart';
import 'package:memo_sample/presentation/page/setting_page/setting_page.dart';
import 'package:memo_sample/presentation/page/sign_in_page/sign_in_page.dart';

final rooterRefreshListenableProvider = Provider(
  (ref) => Listenable.merge(
    [
      ValueNotifier(ref.watch(authControllerProvider).hasAlreadySignedIn),
    ],
  ),
);

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MemoListPage(),
        routes: [
          GoRoute(
            path: 'setting',
            builder: (context, state) => const SettingPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/sign_in',
        builder: (context, state) => const SingInPage(),
      ),
    ],
    redirect: (state) {
      final hasAlreadySignedIn =
          ref.read(authControllerProvider).hasAlreadySignedIn;
      final isGoingToLoginPage = state.subloc == '/sign_in';
      final params = Uri.parse(state.location).queryParameters;
      final from = params['from'] ?? '';

      // ログインしていない状態でログインページ以外にアクセスした場合
      if (!hasAlreadySignedIn && !isGoingToLoginPage) {
        return '/sign_in?from=${state.location}';
      }

      // ログインした状態でログインページにアクセスした場合
      if (hasAlreadySignedIn && isGoingToLoginPage) {
        return from.isNotEmpty && from != '/' ? from : '/';
      }

      return null;
    },
  ),
);
