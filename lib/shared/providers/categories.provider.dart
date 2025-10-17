import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryListProvider = FutureProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.getAllCategories();
});

final addCategoryProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return db.addCategory;
});

final deleteCategoryProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return db.deleteCategory;
});
