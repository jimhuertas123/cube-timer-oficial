import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryListProviderHelper = FutureProvider((ref) async {
  try {
    final db = await ref.watch(dbProvider.future);
    return await db.getAllCategories();
  } catch (e) {
    rethrow;
  }
});

// Add category provider: returns a function that waits for dbProvider
final addCategoryProvider =
    Provider<Future<void> Function(CategoriesCompanion)>((ref) {
      return (categoryCompanion) async {
        final db = await ref.read(dbProvider.future);
        await db.addCategory(categoryCompanion);
        ref.invalidate(categoryListProviderHelper);
      };
    });
// Update category provider: returns a function that waits for dbProvider
final updateCategoryProvider =
    Provider<Future<void> Function(int, CategoriesCompanion)>((ref) {
      return (id, companion) async {
        final db = await ref.read(dbProvider.future);
        await db.updateCategory(id, companion);
        ref.invalidate(categoryListProviderHelper);
      };
    });

// Delete category provider: returns a function that waits for dbProvider
final deleteCategoryProvider = Provider<Future<void> Function(int)>((ref) {
  return (id) async {
    final db = await ref.read(dbProvider.future);
    await db.deleteCategory(id);
    ref.invalidate(categoryListProviderHelper);
  };
});

// Provider to get categories filtered by selected cube type
final categoriesByCubeTypeProvider = Provider<List<Category>>((ref) {
  final categoriesAsync = ref.watch(categoryListProviderHelper);
  final selectedCubeTypeAsync = ref.watch(selectedCubeTypeProvider);
  final categories = categoriesAsync.value ?? [];
  final selectedCubeType = selectedCubeTypeAsync.value;
  if (selectedCubeType == null) return [];
  return categories
      .where((cat) => cat.cubeTypeId == selectedCubeType.id)
      .toList();
});
