import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../category_selection/category_selection.dart';

class ShowDialogCategories extends ConsumerWidget {
  const ShowDialogCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cubeTypeId = ref.watch(selectedCubeTypeProvider).value?.id ?? 0;
    final selectedCategoryId = ref.watch(selectedCategoryProvider(cubeTypeId));

    return selectedCategoryId.when(
      data: (category) =>
          CategorySelection(selectedCategoryId: category?.id ?? 0),
      loading: () => const SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      error: (e, st) => const Icon(
        CupertinoIcons.exclamationmark_circle,
        color: CupertinoColors.destructiveRed,
      ),
    );
  }
}
