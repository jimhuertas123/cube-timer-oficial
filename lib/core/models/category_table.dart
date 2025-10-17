import 'package:drift/drift.dart';
import 'cube_type_table.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get cubeTypeId => integer().references(CubeTypes, #id)();

  // Optional fields for analysis data
  IntColumn get shortestTime => integer().nullable()();
  IntColumn get mean => integer().nullable()();
  IntColumn get m_2 => integer().nullable()();
  IntColumn get deviation => integer().nullable()();
  IntColumn get count => integer().nullable()();
}
