import 'package:cube_timer_oficial/features/timer/presentation/helpers/helpers.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleCategory extends ConsumerWidget {
  final Color textColor;

  const TitleCategory({super.key, required this.textColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final selectedCubeTypeAsync = ref.watch(selectedCubeTypeProvider);
  final cubeTypeId = selectedCubeTypeAsync.value?.id ?? 0;
  final selectedCategoryAsync = ref.watch(selectedCategoryProvider(cubeTypeId));

    final isLoading =
        selectedCategoryAsync.isLoading || selectedCubeTypeAsync.isLoading;
    final hasError =
        selectedCategoryAsync.hasError || selectedCubeTypeAsync.hasError;

    if (isLoading) {
      return const SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    if (hasError) {
      return const Icon(Icons.error, color: Colors.red);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: isAndroidDevice
              ? EdgeInsets.only(left: 58, top: 2)
              : EdgeInsets.zero,
          child: Column(
            children: <Widget>[
              selectedCubeTypeAsync.when(
                data: (cubeType) => Text(
                  '${labelCubeType(cubeType?.type)} Cube',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: isAndroidDevice ? 18 : 21.0,
                    fontFamily: 'Quicksand',
                    color: textColor,
                  ),
                ),
                loading: () => const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                error: (e, st) => const Icon(Icons.error, color: Colors.red),
              ),
              Center(
                child: selectedCategoryAsync.when(
                  data: (category) {
                    final name = category?.name ?? '-';
                    return Text(
                      name.length > 12 ? '${name.substring(0, 12)}...' : name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Quicksand',
                        color: textColor,
                      ),
                    );
                  },
                  loading: () => const SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  error: (e, st) => const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Icon(Icons.arrow_drop_down, color: textColor, size: 20),
      ],
    );
  }
}
