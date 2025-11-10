import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'categories.provider.dart';

class SelectedCategoryNotifier extends AsyncNotifier<Category?> {
  // You must provide the current cubeTypeId when using this notifier
  int? _cubeTypeId;

  void setCubeTypeId(int cubeTypeId) {
    _cubeTypeId = cubeTypeId;
  }

  @override
  Future<Category?> build() async {
    final prefs = await SharedPreferences.getInstance();
    // You must set _cubeTypeId before calling build
    if (_cubeTypeId == null) throw StateError('CubeTypeId not set');
    final key = 'selected_category_id_$_cubeTypeId';
    final lastCategoryId = prefs.getInt(key);
    final categories = await ref.watch(categoryListProviderHelper.future);
    Category selected = categories.firstWhere(
      (c) => c.id == lastCategoryId,
      orElse: () {
        try {
          return categories.firstWhere((c) => c.name == 'normal');
        } catch (_) {
          if (categories.isNotEmpty) {
            return categories.first;
          } else {
            throw StateError('No categories available');
          }
        }
      },
    );
    return selected;
  }

  Future<void> setSelected(Category category) async {
    final prefs = await SharedPreferences.getInstance();
    if (_cubeTypeId == null) throw StateError('CubeTypeId not set');
    final key = 'selected_category_id_$_cubeTypeId';
    await prefs.setInt(key, category.id);
    state = AsyncValue.data(category);
  }
}

final selectedCategoryProvider =
    AsyncNotifierProvider.family<SelectedCategoryNotifier, Category?, int>((
      cubeTypeId,
    ) {
      final notifier = SelectedCategoryNotifier();
      notifier.setCubeTypeId(cubeTypeId);
      return notifier;
    });
