import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/theme.dart' as app_theme;

class ThemeState {
  final Brightness statusBarTextColor;
  final int actualThemeIndex;
  final int actualTextThemeIndex;
  final bool isDarkmode;

  const ThemeState({
    required this.statusBarTextColor,
    required this.actualThemeIndex,
    required this.actualTextThemeIndex,
    required this.isDarkmode,
  });

  ThemeState copyWith({
    Brightness? statusBarTextColor,
    int? actualThemeIndex,
    int? actualTextThemeIndex,
    bool? isDarkmode,
  }) {
    return ThemeState(
      statusBarTextColor: statusBarTextColor ?? this.statusBarTextColor,
      actualThemeIndex: actualThemeIndex ?? this.actualThemeIndex,
      actualTextThemeIndex: actualTextThemeIndex ?? this.actualTextThemeIndex,
      isDarkmode: isDarkmode ?? this.isDarkmode,
    );
  }
}

class ThemeNotifier extends AsyncNotifier<ThemeState> {
  static const _kThemeIndexKey = 'app_theme_index';
  static const _kTextThemeIndexKey = 'app_text_theme_index';
  static const _kIsDarkKey = 'app_is_dark';

  @override
  Future<ThemeState> build() async {
    final prefs = await SharedPreferences.getInstance();
    final idx = prefs.getInt(_kThemeIndexKey) ?? 0;
    final textIdx = prefs.getInt(_kTextThemeIndexKey) ?? 0;

    final initialIsDark = idx < app_theme.appColorTheme.length
        ? app_theme.appColorTheme[idx].isDarkmode
        : false;

    final isDark = prefs.getBool(_kIsDarkKey) ?? initialIsDark;

    return ThemeState(
      actualThemeIndex: idx,
      actualTextThemeIndex: textIdx,
      isDarkmode: isDark,
      statusBarTextColor: isDark ? Brightness.light : Brightness.dark,
    );
  }

  Future<void> setThemeIndex(int idx) async {
    if (state.isLoading ||
        state.hasError ||
        idx < 0 ||
        idx >= app_theme.appColorTheme.length) {
      return;
    }

    final currentState = state.value!;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kThemeIndexKey, idx);
    final isDark = app_theme.appColorTheme[idx].isDarkmode;
    await prefs.setBool(_kIsDarkKey, isDark);

    state = AsyncValue.data(
      currentState.copyWith(
        actualThemeIndex: idx,
        isDarkmode: isDark,
        statusBarTextColor: isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  Future<void> setTextThemeIndex(int idx) async {
    if (state.isLoading ||
        state.hasError ||
        idx < 0 ||
        idx >= app_theme.appTextTheme.length) {
      return;
    }

    final currentState = state.value!;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kTextThemeIndexKey, idx);

    state = AsyncValue.data(currentState.copyWith(actualTextThemeIndex: idx));
  }

  Future<void> toggleDarkMode() async {
    if (state.isLoading || state.hasError) return;

    final currentState = state.value!;

    final prefs = await SharedPreferences.getInstance();
    final next = !currentState.isDarkmode;
    await prefs.setBool(_kIsDarkKey, next);

    state = AsyncValue.data(
      currentState.copyWith(
        isDarkmode: next,
        statusBarTextColor: next ? Brightness.light : Brightness.dark,
      ),
    );
  }
}

final themeNotifierProvider = AsyncNotifierProvider<ThemeNotifier, ThemeState>(
  ThemeNotifier.new,
);
