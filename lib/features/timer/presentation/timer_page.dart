import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/features/timer/presentation/platform_page/platform_page.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCubeTypeAsync = ref.watch(selectedCubeTypeProvider);

    // combine all async states
    final isLoading = selectedCubeTypeAsync.isLoading;
    final hasError = selectedCubeTypeAsync.hasError;
    final error = selectedCubeTypeAsync.error;

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
                  final _ = ref.refresh(selectedCubeTypeProvider);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    // All loaded
    final cubeType = selectedCubeTypeAsync.value;

    if (isIOSDevice) {
      return TimerIOSPage(
        selectedCubeType: cubeType ?? CubeType(id: 1, type: '3x3'),
      );
    } else if (isAndroidDevice) {
      return TimerAndroidPage(
        selectedCubeType: cubeType ?? CubeType(id: 1, type: '3x3'),
      );
    } else {
      return TimerDesktopPage(
        selectedCubeType: cubeType ?? CubeType(id: 1, type: '3x3'),
      );
    }
  }
}
