import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:drift/drift.dart';

class CubeTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().withLength(min: 1, max: 20)();
}

extension CubeTypeExtension on CubeTypeEnum {
  static CubeTypeEnum fromName(String name) =>
      CubeTypeEnum.values.firstWhere((e) => e.name == name);

  String get name => toString().split('.').last;
}
