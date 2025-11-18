import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:drift/drift.dart';

Penalty penaltyFromInt(int? value) => Penalty.values[value ?? 0];
int penaltyToInt(Penalty penalty) => penalty.index;
DateTime dateFromString(String value) => DateTime.parse(value);
String dateToString(DateTime date) => date.toIso8601String();

class TimeRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId =>
      integer().customConstraint('REFERENCES categories(id)')();
  IntColumn get milliseconds => integer()();
  TextColumn get scramble => text().withLength(min: 1, max: 255)();
  TextColumn get date => text()(); //store as ISO8601 string
  TextColumn get comment => text().nullable()();
  IntColumn get penalty =>
      integer().withDefault(const Constant(0))(); //store Penalty as int index
  BoolColumn get isOll => boolean().withDefault(const Constant(false))();
  BoolColumn get isPll => boolean().withDefault(const Constant(false))();
}
