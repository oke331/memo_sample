import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/controller/theme_mode_controller/theme_mode_controller.dart';

class ThemeModeTile extends HookConsumerWidget {
  const ThemeModeTile({
    Key? key,
    required this.title,
    required this.themeMode,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final ThemeMode themeMode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeControllerProvider);
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: Radio(
        groupValue: currentTheme,
        value: themeMode,
        onChanged: (_) => onTap(),
      ),
    );
  }
}
