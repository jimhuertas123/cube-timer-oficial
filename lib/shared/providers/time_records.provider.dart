import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeRecordListProvider = FutureProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.getAllTimeRecords();
});
final addTimeRecordProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return db.addTimeRecord;
});
final deleteTimeRecordProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return db.deleteTimeRecord;
});
