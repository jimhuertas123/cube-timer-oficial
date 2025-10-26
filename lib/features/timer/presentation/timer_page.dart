import 'dart:io';
import 'package:cube_timer_oficial/features/timer/presentation/platform_page/platform_page.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoryListProvider);
    final cubeTypesAsync = ref.watch(cubeTypesProvider);

    // combine all async states
    final isLoading = categoriesAsync.isLoading  || cubeTypesAsync.isLoading;
    final hasError = categoriesAsync.hasError || cubeTypesAsync.hasError;
    final error = categoriesAsync.error ?? cubeTypesAsync.error;

    if (isLoading) {
      return const CupertinoScaffold(
        transitionBackgroundColor: CupertinoColors.activeBlue,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    if (hasError) {
      return CupertinoScaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Failed to load: $error'),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  // ignore: unused_result
                  ref.refresh(categoryListProvider);
                  // ignore: unused_result
                  ref.refresh(selectedCategoryProvider);
                  // ignore: unused_result
                  ref.refresh(selectedCubeTypeProvider);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    // All loaded
    final categories = categoriesAsync.value;
    final cubeTypes = cubeTypesAsync.value;

    if (Platform.isIOS) {
      return TimerIOSPage(
        cubeTypes: cubeTypes ?? [],
        categories: categories ?? [],
      );
    } else if (Platform.isAndroid) {
      return TimerAndroidPage(
        cubeTypes: cubeTypes ?? [],
        categories: categories ?? [],
      );
    } else {
      return TimerDesktopPage(
        categories: categories ?? [],
        cubeTypes: cubeTypes ?? [],
      );
    }
  }
}
