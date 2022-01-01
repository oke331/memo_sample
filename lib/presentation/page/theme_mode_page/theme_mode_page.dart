import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/page/theme_mode_page/theme_mode_body.dart';

class ThemeModePage extends HookConsumerWidget {
  const ThemeModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ダークテーマ'),
      ),
      body: const ThemeModeBody(),
    );
  }
}
