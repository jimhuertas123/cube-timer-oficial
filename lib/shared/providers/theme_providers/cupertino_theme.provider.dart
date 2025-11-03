import 'package:cube_timer_oficial/shared/providers/theme_providers/theme.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/theme.dart' as app_theme;

class CupertinoThemeWithGradient {
  final CupertinoThemeData themeData;
  final List<Color> gradientColors;
  final Color bottomAppbarColor;
  const CupertinoThemeWithGradient({
    required this.themeData,
    required this.gradientColors,
    required this.bottomAppbarColor,
  });
}

final cupertinoThemeProvider = Provider<CupertinoThemeWithGradient>((ref) {
  final themeStateAsync = ref.watch(themeNotifierProvider);

  return themeStateAsync.when(
    loading: () => const CupertinoThemeWithGradient(
      themeData: CupertinoThemeData(brightness: Brightness.light),
      gradientColors: [CupertinoColors.white, CupertinoColors.white],
      bottomAppbarColor: CupertinoColors.lightBackgroundGray,
    ),
    error: (err, stack) {
      if (kDebugMode) {
        print('Error loading theme: $err');
      }
      return const CupertinoThemeWithGradient(
        themeData: CupertinoThemeData(brightness: Brightness.light),
        gradientColors: [CupertinoColors.white, CupertinoColors.white],
        bottomAppbarColor: CupertinoColors.lightBackgroundGray,
      );
    },
    data: (s) {
      final theme = app_theme.appColorTheme[s.actualThemeIndex];
      final textColor =
          app_theme.appTextTheme[s.actualTextThemeIndex].colorText ??
          (s.isDarkmode ? CupertinoColors.white : CupertinoColors.black);

      final themeData = CupertinoThemeData(
        brightness: s.isDarkmode ? Brightness.dark : Brightness.light,
        primaryColor: theme.bgPatternColor.primaryColor,
        barBackgroundColor: theme.appBarColor,
        scaffoldBackgroundColor: theme.bgPatternColor.secondaryColor,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: textColor),
        ),
      );

      final gradientColors = [
        theme.bgPatternColor.primaryColor,
        theme.bgPatternColor.secondaryColor,
      ];

      return CupertinoThemeWithGradient(
        themeData: themeData,
        gradientColors: gradientColors,
        bottomAppbarColor: theme.bottomBarColor,
      );
    },
  );
});
