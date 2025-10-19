import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/providers/db.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeRecordListProvider = FutureProvider((ref) async {
  final db = await ref.watch(dbProvider.future);
  return db.getAllTimeRecords();
});
final addTimeRecordProvider = Provider<Future<void> Function(TimeRecord)>((ref) {
  return (timeRecord) async {
    final db = await ref.read(dbProvider.future);
    await db.addTimeRecord(timeRecord);
    ref.invalidate(timeRecordListProvider);
  };
});
final deleteTimeRecordProvider = Provider<Future<void> Function(int)>((ref) {
  return (id) async {
    final db = await ref.read(dbProvider.future);
    await db.deleteTimeRecord(id);
    ref.invalidate(timeRecordListProvider);
  };
});
