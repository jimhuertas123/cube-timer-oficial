import 'package:cube_timer_oficial/features/timer/presentation/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        home: HomeScreen(),
      );
    } else {
      return MaterialApp(
        theme: materialTheme,
        home: HomeScreen(),
      );
    }
  }
}
