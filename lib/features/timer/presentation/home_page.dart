import 'dart:io';

import 'package:cube_timer_oficial/features/timer/presentation/platform_page/platform_page.dart';
import 'package:cube_timer_oficial/shared/providers/categories.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoryListProvider);

    switch (categoriesAsync) {
      case AsyncValue(:final value?):
        if (Platform.isIOS) {
          return HomeIOSPage(categories: value);
        } else if (Platform.isAndroid) {
          return HomeAndroidPage(categories: value);
        } else {
          return HomeDesktopPage(categories: value);
        }
      case AsyncValue(error: final error):
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Failed to load categories: $error'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => ref.refresh(categoryListProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      // ignore: dead_code, unreachable_switch_case
      case AsyncValue():
        // ignore: dead_code
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}
