import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeModeRepositoryProvider =
    Provider((ref) => ThemeModeRepository._(ref.read));

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

class ThemeModeRepository {
  ThemeModeRepository._(this._read);
  final Reader _read;
  static const _themeKey = 'themeKey';

  SharedPreferences get _prefs => _read(sharedPreferencesProvider);

  ThemeMode? getThemeMode() {
    final themeString = _prefs.getString(_themeKey);
    return themeString != null ? ThemeMode.values.byName(themeString) : null;
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    await _prefs.setString(_themeKey, theme.name);
  }
}
