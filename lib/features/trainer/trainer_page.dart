import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/features/trainer/platform_page/platform_page.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../shared/providers/providers.dart';

class TrainerPage extends ConsumerWidget {
  final TrainerType type;

  const TrainerPage({super.key, required this.type});

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
      return TrainerIOSPage(
        selectedCubeType: cubeType ?? CubeType(id: 1, type: '3x3'),
        type: type,
      );
    } else if (isAndroidDevice) {
      return TrainerAndroidPage(
        selectedCubeType: cubeType ?? CubeType(id: 1, type: '3x3'),
        type: type,
      );
    } else {
      return TrainerAndroidPage(
        selectedCubeType: cubeType ?? CubeType(id: 1, type: '3x3'),
        type: type,
      );
    }
  }
}
