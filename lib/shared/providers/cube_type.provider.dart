import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/providers/db.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cubeTypesProvider = FutureProvider<List<CubeType>>((ref) async {
  final db = await ref.watch(dbProvider.future);
  return await db.select(db.cubeTypes).get();
});
