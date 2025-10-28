import 'dart:io';
import 'package:cube_timer_oficial/core/core.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart'; // Generated file

@DriftDatabase(tables: [CubeTypes, Categories, TimeRecords])
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());

  static Future<AppDatabase> create() async {
    final db = AppDatabase._();
    await db._insertDefaultCubeTypes();
    await db._insertDefaultNormalCategories();
    return db;
  }

  @override
  int get schemaVersion => 1;

  /// instead of change cubeTypes it just need default values
  Future<void> _insertDefaultCubeTypes() async {
    final existing = await select(cubeTypes).get();
    if (existing.isEmpty) {
      final defaultTypes = [
        'twoByTwo',
        'threeByThree',
        'fourByFour',
        'fiveByFive',
        'sixBySix',
        'sevenBySeven',
      ];
      for (final type in defaultTypes) {
        await into(cubeTypes).insert(CubeTypesCompanion(type: Value(type)));
      }
    }
  }

  ///insert a 'Normal' category for each cube type if not present
  Future<void> _insertDefaultNormalCategories() async {
    final insertedCubeTypes = await select(cubeTypes).get();
    for (final cubeType in insertedCubeTypes) {
      final existingNormal =
          await (select(categories)..where(
                (c) =>
                    c.cubeTypeId.equals(cubeType.id) & c.name.equals('normal'),
              ))
              .getSingleOrNull();
      if (existingNormal == null) {
        await into(categories).insert(
          CategoriesCompanion(
            name: Value('normal'),
            cubeTypeId: Value(cubeType.id),
            shortestTime: const Value.absent(),
            mean: const Value.absent(),
            m_2: const Value.absent(),
            deviation: const Value.absent(),
            count: const Value.absent(),
          ),
        );
      }
    }
  }

  //Categories CRUD
  Future<List<Category>> getAllCategories() => select(categories).get();
  Future<void> addCategory(CategoriesCompanion category) =>
      into(categories).insert(category);
  Future<void> deleteCategory(int id) =>
      (delete(categories)..where((c) => c.id.equals(id))).go();
  Future<void> updateCategory(int id, CategoriesCompanion companion) async {
    await (update(categories)..where((c) => c.id.equals(id))).write(companion);
  }

  //TimeRecords CRUD
  Future<List<TimeRecord>> getAllTimeRecords() => select(timeRecords).get();
  Future<void> addTimeRecord(TimeRecord timeRecord) => into(timeRecords).insert(
    TimeRecordsCompanion(
      categoryId: Value(timeRecord.categoryId),
      milliseconds: Value(timeRecord.milliseconds),
      scramble: Value(timeRecord.scramble),
      date: Value(timeRecord.date),
      comment: Value(timeRecord.comment),
      penalty: Value(timeRecord.penalty),
    ),
  );
  Future<void> deleteTimeRecord(int id) =>
      (delete(timeRecords)..where((t) => t.id.equals(id))).go();
  Future<void> updateTimeRecord(int id, {String? comment, int? penalty}) async {
    await (update(timeRecords)..where((t) => t.id.equals(id))).write(
      TimeRecordsCompanion(
        comment: comment != null ? Value(comment) : const Value.absent(),
        penalty: penalty != null ? Value(penalty) : const Value.absent(),
      ),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
