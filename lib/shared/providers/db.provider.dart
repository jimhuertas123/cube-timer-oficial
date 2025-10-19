import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbProvider = FutureProvider<AppDatabase>((ref) async {
  final db = await AppDatabase.create();

  ref.onDispose(() {
    db.close();
  });

  return db;
});
