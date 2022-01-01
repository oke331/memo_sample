import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/presentation/controller/theme_mode_controller/theme_mode_controller.dart';
import 'package:memo_sample/presentation/page/theme_mode_page/theme_mode_tile.dart';

class ThemeModeBody extends HookConsumerWidget {
  const ThemeModeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeControllerProvider);
    final controller = ref.watch(themeModeControllerProvider.notifier);
    final _tileContents = [
      ThemeModeTile(
        title: S.of(context).systemTheme,
        selected: currentTheme == ThemeMode.system,
        onTap: () => controller.updateThemeMode(ThemeMode.system),
      ),
      ThemeModeTile(
        title: S.of(context).on,
        selected: currentTheme == ThemeMode.dark,
        onTap: () => controller.updateThemeMode(ThemeMode.dark),
      ),
      ThemeModeTile(
        title: S.of(context).off,
        selected: currentTheme == ThemeMode.light,
        onTap: () => controller.updateThemeMode(ThemeMode.light),
      ),
    ];
    return ListView.separated(
      itemCount: _tileContents.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (BuildContext context, int index) => _tileContents[index],
    );
  }
}
