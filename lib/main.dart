import 'package:cube_timer_oficial/features/timer/presentation/timer_page.dart';
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
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    if (isIOS) {
      return CupertinoApp(
        theme: cupertinoTheme,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialWithModalsPageRoute(
                builder: (context) => HomeScreen(),
                settings: settings,
              );
            // case '/settings':
            //   return MaterialWithModalsPageRoute(
            //     builder: (context) => SettingsScreen(),
            //     settings: settings,
            //   );
            // // Add more routes here
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
      );
    }
  }
}
