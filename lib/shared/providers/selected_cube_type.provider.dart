import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db.provider.dart';

class SelectedCubeTypeNotifier extends AsyncNotifier<CubeType?> {
  @override
  Future<CubeType?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final lastCubeTypeId = prefs.getInt('selected_cube_type_id');
    final db = await ref.watch(dbProvider.future);
    final cubeTypes = await db.select(db.cubeTypes).get();
    // helper: try to find last selected, else first 'threeByThree' cube type
    CubeType selected = cubeTypes.firstWhere(
      (c) => c.id == lastCubeTypeId,
      orElse: () {
        try {
          return cubeTypes.firstWhere((c) => c.type == 'threeByThree');
        } catch (_) {
          if (cubeTypes.isNotEmpty) {
            return cubeTypes.first;
          } else {
            throw StateError('No cube types available');
          }
        }
      },
    );
    return selected;
  }

  Future<void> setSelected(CubeType cubeType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_cube_type_id', cubeType.id);

    // Also update selected category for this cubeType
    // Find the last selected category for this cubeType, or fallback
    final db = await ref.watch(dbProvider.future);
    final categories = await db.select(db.categories).get();
    Category? selectedCategory;
    try {
      selectedCategory = categories.firstWhere(
        (c) => c.cubeTypeId == cubeType.id && c.name == 'normal',
      );
    } catch (_) {
      selectedCategory = categories.isNotEmpty
          ? categories.firstWhere(
              (c) => c.cubeTypeId == cubeType.id,
              orElse: () => categories.first,
            )
          : null;
    }
    if (selectedCategory != null) {
      await prefs.setInt(
        'selected_category_id_${cubeType.id}',
        selectedCategory.id,
      );
    }

    state = AsyncValue.data(cubeType);
  }
}

final selectedCubeTypeProvider =
    AsyncNotifierProvider<SelectedCubeTypeNotifier, CubeType?>(
      SelectedCubeTypeNotifier.new,
    );
