import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_sample/infrastructure/repository/theme_mode_repository.dart';

final themeModeControllerProvider =
    StateNotifierProvider<ThemeModeController, ThemeMode>(
  (ref) => ThemeModeController._(ref.read),
);

class ThemeModeController extends StateNotifier<ThemeMode> {
  ThemeModeController._(this._read)
      : super(_read(themeModeRepositoryProvider).getThemeMode() ??
            ThemeMode.system);

  final Reader _read;
  ThemeModeRepository get _themeModeRepository =>
      _read(themeModeRepositoryProvider);

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    if (themeMode == state) {
      return;
    }
    state = themeMode;
    await _themeModeRepository.updateThemeMode(themeMode);
  }
}
