import 'package:cube_timer_oficial/shared/providers/theme_providers/theme.provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/theme.dart' as app_theme;

final materialThemeProvider = Provider<ThemeData>((ref) {
  final themeStateAsync = ref.watch(themeNotifierProvider);

  return themeStateAsync.when(
    loading: () => ThemeData.light(),
    error: (err, stack) {
      if (kDebugMode) {
        print('Error loading theme: $err');
      }
      return ThemeData.light();
    },
    data: (s) {
      final theme = app_theme.appColorTheme[s.actualThemeIndex];
      final textColor =
          app_theme.appTextTheme[s.actualTextThemeIndex].colorText ??
          (s.isDarkmode ? Colors.white : Colors.black);

      final base = ThemeData(
        brightness: s.isDarkmode ? Brightness.dark : Brightness.light,
        primaryColor: theme.patternColor.primaryColor,
        scaffoldBackgroundColor: theme.patternColor.secondaryColor,
        appBarTheme: AppBarTheme(backgroundColor: theme.appBarColor),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: theme.bottomBarColor,
        ),
      );

      return base.copyWith(
        textTheme: base.textTheme.apply(
          bodyColor: textColor,
          displayColor: textColor,
        ),
        primaryTextTheme: base.primaryTextTheme.apply(
          bodyColor: textColor,
          displayColor: textColor,
        ),
      );
    },
  );
});
