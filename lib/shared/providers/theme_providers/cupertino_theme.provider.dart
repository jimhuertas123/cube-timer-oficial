import 'package:cube_timer_oficial/shared/providers/theme_providers/theme.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/theme.dart' as app_theme;

class CupertinoThemeWithGradient {
  final CupertinoThemeData themeData;
  final List<Color> gradientColors;
  const CupertinoThemeWithGradient({
    required this.themeData,
    required this.gradientColors,
  });
}

final cupertinoThemeProvider = Provider<CupertinoThemeWithGradient>((ref) {
  final themeStateAsync = ref.watch(themeNotifierProvider);

  return themeStateAsync.when(
    loading: () => const CupertinoThemeWithGradient(
      themeData: CupertinoThemeData(brightness: Brightness.light),
      gradientColors: [CupertinoColors.white, CupertinoColors.white],
    ),
    error: (err, stack) {
      if (kDebugMode) {
        print('Error loading theme: $err');
      }
      return const CupertinoThemeWithGradient(
        themeData: CupertinoThemeData(brightness: Brightness.light),
        gradientColors: [CupertinoColors.white, CupertinoColors.white],
      );
    },
    data: (s) {
      final theme = app_theme.appColorTheme[s.actualThemeIndex];
      final textColor =
          app_theme.appTextTheme[s.actualTextThemeIndex].colorText ??
          (s.isDarkmode ? CupertinoColors.white : CupertinoColors.black);

      final themeData = CupertinoThemeData(
        brightness: s.isDarkmode ? Brightness.dark : Brightness.light,
        primaryColor: theme.patternColor.primaryColor,
        barBackgroundColor: theme.appBarColor,
        scaffoldBackgroundColor: theme.patternColor.secondaryColor,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: textColor),
        ),
      );

      final gradientColors = [
        theme.patternColor.primaryColor,
        theme.patternColor.secondaryColor,
      ];

      return CupertinoThemeWithGradient(
        themeData: themeData,
        gradientColors: gradientColors,
      );
    },
  );
});
