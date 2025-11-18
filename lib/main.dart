import 'package:cube_timer_oficial/core/core.dart';
import 'package:cube_timer_oficial/features/about/about_page.dart';
import 'package:cube_timer_oficial/features/oll/oll_algorithms_page.dart';
import 'package:cube_timer_oficial/features/pll/pll_algorithms_page.dart';
import 'package:cube_timer_oficial/features/settings/settings_page.dart';
import 'package:cube_timer_oficial/features/timer/presentation/timer_page.dart';
import 'package:cube_timer_oficial/features/trainer/trainer_page.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'shared/providers/theme_providers/theme_providers.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final materialTheme = ref.watch(materialThemeProvider);
    final cupertinoTheme = ref.watch(cupertinoThemeProvider).themeData;

    if (isIOSDevice) {
      return CupertinoApp(
        theme: cupertinoTheme,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialWithModalsPageRoute(
                builder: (context) => HomeScreen(),
                settings: settings,
              );
            case '/oll_algorithms':
              return MaterialWithModalsPageRoute(
                builder: (context) => OllAlgorithmsPage(),
                settings: settings,
              );
            case '/pll_algorithms':
              return MaterialWithModalsPageRoute(
                builder: (context) => PllAlgorithmsPage(),
                settings: settings,
              );
            case '/oll_timer':
              return MaterialWithModalsPageRoute(
                builder: (context) => TrainerPage(type: TrainerType.oll),
                settings: settings,
              );
            case '/pll_timer':
              return MaterialWithModalsPageRoute(
                builder: (context) => TrainerPage(type: TrainerType.pll),
                settings: settings,
              );
            case '/about':
              return MaterialWithModalsPageRoute(
                builder: (context) => AboutPage(),
                settings: settings,
              );
            case '/settings':
              return MaterialWithModalsPageRoute(
                builder: (context) => SettingsPage(),
                settings: settings,
              );
            // default:
            //   return MaterialWithModalsPageRoute(
            //     builder: (context) => NotFoundScreen(),
            //     settings: settings,
            //   );
          }
          return null;
        },
      );
    } else {
      return MaterialApp(
        theme: materialTheme,
        home: HomeScreen(),
        routes: {
          '/oll_algorithms': (context) => OllAlgorithmsPage(),
          '/pll_algorithms': (context) => PllAlgorithmsPage(),
          '/oll_timer': (context) => TrainerPage(type: TrainerType.oll),
          '/pll_timer': (context) => TrainerPage(type: TrainerType.pll),
          '/about': (context) => AboutPage(),
          '/settings': (context) => SettingsPage(),
        },
      );
    }
  }
}
