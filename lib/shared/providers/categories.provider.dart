import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cube_timer_oficial/shared/providers/db.provider.dart';

final categoryListProvider = FutureProvider((ref) async {
  try {
    final db = await ref.watch(dbProvider.future);
    return await db.getAllCategories();
  } catch (e) {
    rethrow;
  }
});

// Add category provider: returns a function that waits for dbProvider
final addCategoryProvider = Provider<Future<void> Function(Category)>((ref) {
  return (category) async {
    final db = await ref.read(dbProvider.future);
    await db.addCategory(category);
    ref.invalidate(categoryListProvider);
  };
});

// Delete category provider: returns a function that waits for dbProvider
final deleteCategoryProvider = Provider<Future<void> Function(int)>((ref) {
  return (id) async {
    final db = await ref.read(dbProvider.future);
    await db.deleteCategory(id);
    ref.invalidate(categoryListProvider);
  };
});