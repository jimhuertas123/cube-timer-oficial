import 'dart:io' show Platform;

import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:cube_timer_oficial/shared/widgets/button_splash/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

/// **IOS**: animation IOS scale entire button with animation container (still pending).
///
/// **ANDROID**: animation Android only splash on long press like original material design for twisty timer.
class CustomButtonSplash extends ConsumerWidget {
  final int id;
  final EdgeInsetsGeometry padding;
  final CubeType cubeType;

  const CustomButtonSplash({
    super.key,
    required this.padding,
    required this.id,
    required this.cubeType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCubeAsync = ref.watch(selectedCubeTypeProvider);

    final isLoading = selectedCubeAsync.isLoading;
    final hasError = selectedCubeAsync.hasError;
    final error = selectedCubeAsync.error;

    void onPress(int id) {
      if (hasError || isLoading) return;
      if (selectedCubeAsync.value?.id == id) return;
      ref.read(selectedCubeTypeProvider.notifier).setSelected(cubeType);
      Navigator.of(context).pop();
    }

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (hasError) {
      return Center(child: Text('Error: $error'));
    }

    if (Platform.isIOS) {
      return IOSButtonSplashRow(cubeType: cubeType, id: id, onPress: onPress);
    } else {
      return AndroidButtonSplashRow(
        cubeType: cubeType,
        id: id,
        onPress: onPress,
        padding: padding,
      );
    }
  }
}
