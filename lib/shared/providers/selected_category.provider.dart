import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'categories.provider.dart';

class SelectedCategoryNotifier extends AsyncNotifier<Category?> {
  @override
  Future<Category?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final lastCategoryId = prefs.getInt('selected_category_id');
    final categories = await ref.watch(categoryListProviderHelper.future);
    // helper: try to find last selected, else first 'normal' category
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
    await prefs.setInt('selected_category_id', category.id);
    state = AsyncValue.data(category);
  }
}

final selectedCategoryProvider =
    AsyncNotifierProvider<SelectedCategoryNotifier, Category?>(
      SelectedCategoryNotifier.new,
    );
