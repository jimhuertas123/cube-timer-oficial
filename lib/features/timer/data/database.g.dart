// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CubeTypesTable extends CubeTypes
    with TableInfo<$CubeTypesTable, CubeType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CubeTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cube_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<CubeType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CubeType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CubeType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  $CubeTypesTable createAlias(String alias) {
    return $CubeTypesTable(attachedDatabase, alias);
  }
}

class CubeType extends DataClass implements Insertable<CubeType> {
  final int id;
  final String type;
  const CubeType({required this.id, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    return map;
  }

  CubeTypesCompanion toCompanion(bool nullToAbsent) {
    return CubeTypesCompanion(id: Value(id), type: Value(type));
  }

  factory CubeType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CubeType(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
    };
  }

  CubeType copyWith({int? id, String? type}) =>
      CubeType(id: id ?? this.id, type: type ?? this.type);
  CubeType copyWithCompanion(CubeTypesCompanion data) {
    return CubeType(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CubeType(')
          ..write('id: $id, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CubeType && other.id == this.id && other.type == this.type);
}

class CubeTypesCompanion extends UpdateCompanion<CubeType> {
  final Value<int> id;
  final Value<String> type;
  const CubeTypesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
  });
  CubeTypesCompanion.insert({
    this.id = const Value.absent(),
    required String type,
  }) : type = Value(type);
  static Insertable<CubeType> custom({
    Expression<int>? id,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
    });
  }

  CubeTypesCompanion copyWith({Value<int>? id, Value<String>? type}) {
    return CubeTypesCompanion(id: id ?? this.id, type: type ?? this.type);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CubeTypesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cubeTypeIdMeta = const VerificationMeta(
    'cubeTypeId',
  );
  @override
  late final GeneratedColumn<int> cubeTypeId = GeneratedColumn<int>(
    'cube_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cube_types (id)',
    ),
  );
  static const VerificationMeta _shortestTimeMeta = const VerificationMeta(
    'shortestTime',
  );
  @override
  late final GeneratedColumn<int> shortestTime = GeneratedColumn<int>(
    'shortest_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _meanMeta = const VerificationMeta('mean');
  @override
  late final GeneratedColumn<int> mean = GeneratedColumn<int>(
    'mean',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _m_2Meta = const VerificationMeta('m_2');
  @override
  late final GeneratedColumn<int> m_2 = GeneratedColumn<int>(
    'm_2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviationMeta = const VerificationMeta(
    'deviation',
  );
  @override
  late final GeneratedColumn<int> deviation = GeneratedColumn<int>(
    'deviation',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    cubeTypeId,
    shortestTime,
    mean,
    m_2,
    deviation,
    count,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cube_type_id')) {
      context.handle(
        _cubeTypeIdMeta,
        cubeTypeId.isAcceptableOrUnknown(
          data['cube_type_id']!,
          _cubeTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cubeTypeIdMeta);
    }
    if (data.containsKey('shortest_time')) {
      context.handle(
        _shortestTimeMeta,
        shortestTime.isAcceptableOrUnknown(
          data['shortest_time']!,
          _shortestTimeMeta,
        ),
      );
    }
    if (data.containsKey('mean')) {
      context.handle(
        _meanMeta,
        mean.isAcceptableOrUnknown(data['mean']!, _meanMeta),
      );
    }
    if (data.containsKey('m_2')) {
      context.handle(
        _m_2Meta,
        m_2.isAcceptableOrUnknown(data['m_2']!, _m_2Meta),
      );
    }
    if (data.containsKey('deviation')) {
      context.handle(
        _deviationMeta,
        deviation.isAcceptableOrUnknown(data['deviation']!, _deviationMeta),
      );
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      cubeTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cube_type_id'],
      )!,
      shortestTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shortest_time'],
      ),
      mean: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mean'],
      ),
      m_2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}m_2'],
      ),
      deviation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deviation'],
      ),
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int cubeTypeId;
  final int? shortestTime;
  final int? mean;
  final int? m_2;
  final int? deviation;
  final int? count;
  const Category({
    required this.id,
    required this.name,
    required this.cubeTypeId,
    this.shortestTime,
    this.mean,
    this.m_2,
    this.deviation,
    this.count,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['cube_type_id'] = Variable<int>(cubeTypeId);
    if (!nullToAbsent || shortestTime != null) {
      map['shortest_time'] = Variable<int>(shortestTime);
    }
    if (!nullToAbsent || mean != null) {
      map['mean'] = Variable<int>(mean);
    }
    if (!nullToAbsent || m_2 != null) {
      map['m_2'] = Variable<int>(m_2);
    }
    if (!nullToAbsent || deviation != null) {
      map['deviation'] = Variable<int>(deviation);
    }
    if (!nullToAbsent || count != null) {
      map['count'] = Variable<int>(count);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      cubeTypeId: Value(cubeTypeId),
      shortestTime: shortestTime == null && nullToAbsent
          ? const Value.absent()
          : Value(shortestTime),
      mean: mean == null && nullToAbsent ? const Value.absent() : Value(mean),
      m_2: m_2 == null && nullToAbsent ? const Value.absent() : Value(m_2),
      deviation: deviation == null && nullToAbsent
          ? const Value.absent()
          : Value(deviation),
      count: count == null && nullToAbsent
          ? const Value.absent()
          : Value(count),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      cubeTypeId: serializer.fromJson<int>(json['cubeTypeId']),
      shortestTime: serializer.fromJson<int?>(json['shortestTime']),
      mean: serializer.fromJson<int?>(json['mean']),
      m_2: serializer.fromJson<int?>(json['m_2']),
      deviation: serializer.fromJson<int?>(json['deviation']),
      count: serializer.fromJson<int?>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'cubeTypeId': serializer.toJson<int>(cubeTypeId),
      'shortestTime': serializer.toJson<int?>(shortestTime),
      'mean': serializer.toJson<int?>(mean),
      'm_2': serializer.toJson<int?>(m_2),
      'deviation': serializer.toJson<int?>(deviation),
      'count': serializer.toJson<int?>(count),
    };
  }

  Category copyWith({
    int? id,
    String? name,
    int? cubeTypeId,
    Value<int?> shortestTime = const Value.absent(),
    Value<int?> mean = const Value.absent(),
    Value<int?> m_2 = const Value.absent(),
    Value<int?> deviation = const Value.absent(),
    Value<int?> count = const Value.absent(),
  }) => Category(
    id: id ?? this.id,
    name: name ?? this.name,
    cubeTypeId: cubeTypeId ?? this.cubeTypeId,
    shortestTime: shortestTime.present ? shortestTime.value : this.shortestTime,
    mean: mean.present ? mean.value : this.mean,
    m_2: m_2.present ? m_2.value : this.m_2,
    deviation: deviation.present ? deviation.value : this.deviation,
    count: count.present ? count.value : this.count,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      cubeTypeId: data.cubeTypeId.present
          ? data.cubeTypeId.value
          : this.cubeTypeId,
      shortestTime: data.shortestTime.present
          ? data.shortestTime.value
          : this.shortestTime,
      mean: data.mean.present ? data.mean.value : this.mean,
      m_2: data.m_2.present ? data.m_2.value : this.m_2,
      deviation: data.deviation.present ? data.deviation.value : this.deviation,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cubeTypeId: $cubeTypeId, ')
          ..write('shortestTime: $shortestTime, ')
          ..write('mean: $mean, ')
          ..write('m_2: $m_2, ')
          ..write('deviation: $deviation, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    cubeTypeId,
    shortestTime,
    mean,
    m_2,
    deviation,
    count,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.cubeTypeId == this.cubeTypeId &&
          other.shortestTime == this.shortestTime &&
          other.mean == this.mean &&
          other.m_2 == this.m_2 &&
          other.deviation == this.deviation &&
          other.count == this.count);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> cubeTypeId;
  final Value<int?> shortestTime;
  final Value<int?> mean;
  final Value<int?> m_2;
  final Value<int?> deviation;
  final Value<int?> count;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.cubeTypeId = const Value.absent(),
    this.shortestTime = const Value.absent(),
    this.mean = const Value.absent(),
    this.m_2 = const Value.absent(),
    this.deviation = const Value.absent(),
    this.count = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int cubeTypeId,
    this.shortestTime = const Value.absent(),
    this.mean = const Value.absent(),
    this.m_2 = const Value.absent(),
    this.deviation = const Value.absent(),
    this.count = const Value.absent(),
  }) : name = Value(name),
       cubeTypeId = Value(cubeTypeId);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? cubeTypeId,
    Expression<int>? shortestTime,
    Expression<int>? mean,
    Expression<int>? m_2,
    Expression<int>? deviation,
    Expression<int>? count,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (cubeTypeId != null) 'cube_type_id': cubeTypeId,
      if (shortestTime != null) 'shortest_time': shortestTime,
      if (mean != null) 'mean': mean,
      if (m_2 != null) 'm_2': m_2,
      if (deviation != null) 'deviation': deviation,
      if (count != null) 'count': count,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? cubeTypeId,
    Value<int?>? shortestTime,
    Value<int?>? mean,
    Value<int?>? m_2,
    Value<int?>? deviation,
    Value<int?>? count,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      cubeTypeId: cubeTypeId ?? this.cubeTypeId,
      shortestTime: shortestTime ?? this.shortestTime,
      mean: mean ?? this.mean,
      m_2: m_2 ?? this.m_2,
      deviation: deviation ?? this.deviation,
      count: count ?? this.count,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (cubeTypeId.present) {
      map['cube_type_id'] = Variable<int>(cubeTypeId.value);
    }
    if (shortestTime.present) {
      map['shortest_time'] = Variable<int>(shortestTime.value);
    }
    if (mean.present) {
      map['mean'] = Variable<int>(mean.value);
    }
    if (m_2.present) {
      map['m_2'] = Variable<int>(m_2.value);
    }
    if (deviation.present) {
      map['deviation'] = Variable<int>(deviation.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cubeTypeId: $cubeTypeId, ')
          ..write('shortestTime: $shortestTime, ')
          ..write('mean: $mean, ')
          ..write('m_2: $m_2, ')
          ..write('deviation: $deviation, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }
}

class $TimeRecordsTable extends TimeRecords
    with TableInfo<$TimeRecordsTable, TimeRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _millisecondsMeta = const VerificationMeta(
    'milliseconds',
  );
  @override
  late final GeneratedColumn<int> milliseconds = GeneratedColumn<int>(
    'milliseconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scrambleMeta = const VerificationMeta(
    'scramble',
  );
  @override
  late final GeneratedColumn<String> scramble = GeneratedColumn<String>(
    'scramble',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _penaltyMeta = const VerificationMeta(
    'penalty',
  );
  @override
  late final GeneratedColumn<int> penalty = GeneratedColumn<int>(
    'penalty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    milliseconds,
    scramble,
    date,
    comment,
    penalty,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'time_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimeRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('milliseconds')) {
      context.handle(
        _millisecondsMeta,
        milliseconds.isAcceptableOrUnknown(
          data['milliseconds']!,
          _millisecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_millisecondsMeta);
    }
    if (data.containsKey('scramble')) {
      context.handle(
        _scrambleMeta,
        scramble.isAcceptableOrUnknown(data['scramble']!, _scrambleMeta),
      );
    } else if (isInserting) {
      context.missing(_scrambleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('penalty')) {
      context.handle(
        _penaltyMeta,
        penalty.isAcceptableOrUnknown(data['penalty']!, _penaltyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimeRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimeRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      milliseconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}milliseconds'],
      )!,
      scramble: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scramble'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
      penalty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}penalty'],
      )!,
    );
  }

  @override
  $TimeRecordsTable createAlias(String alias) {
    return $TimeRecordsTable(attachedDatabase, alias);
  }
}

class TimeRecord extends DataClass implements Insertable<TimeRecord> {
  final int id;
  final int categoryId;
  final int milliseconds;
  final String scramble;
  final String date;
  final String? comment;
  final int penalty;
  const TimeRecord({
    required this.id,
    required this.categoryId,
    required this.milliseconds,
    required this.scramble,
    required this.date,
    this.comment,
    required this.penalty,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['milliseconds'] = Variable<int>(milliseconds);
    map['scramble'] = Variable<String>(scramble);
    map['date'] = Variable<String>(date);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['penalty'] = Variable<int>(penalty);
    return map;
  }

  TimeRecordsCompanion toCompanion(bool nullToAbsent) {
    return TimeRecordsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      milliseconds: Value(milliseconds),
      scramble: Value(scramble),
      date: Value(date),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      penalty: Value(penalty),
    );
  }

  factory TimeRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeRecord(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      milliseconds: serializer.fromJson<int>(json['milliseconds']),
      scramble: serializer.fromJson<String>(json['scramble']),
      date: serializer.fromJson<String>(json['date']),
      comment: serializer.fromJson<String?>(json['comment']),
      penalty: serializer.fromJson<int>(json['penalty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'milliseconds': serializer.toJson<int>(milliseconds),
      'scramble': serializer.toJson<String>(scramble),
      'date': serializer.toJson<String>(date),
      'comment': serializer.toJson<String?>(comment),
      'penalty': serializer.toJson<int>(penalty),
    };
  }

  TimeRecord copyWith({
    int? id,
    int? categoryId,
    int? milliseconds,
    String? scramble,
    String? date,
    Value<String?> comment = const Value.absent(),
    int? penalty,
  }) => TimeRecord(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    milliseconds: milliseconds ?? this.milliseconds,
    scramble: scramble ?? this.scramble,
    date: date ?? this.date,
    comment: comment.present ? comment.value : this.comment,
    penalty: penalty ?? this.penalty,
  );
  TimeRecord copyWithCompanion(TimeRecordsCompanion data) {
    return TimeRecord(
      id: data.id.present ? data.id.value : this.id,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      milliseconds: data.milliseconds.present
          ? data.milliseconds.value
          : this.milliseconds,
      scramble: data.scramble.present ? data.scramble.value : this.scramble,
      date: data.date.present ? data.date.value : this.date,
      comment: data.comment.present ? data.comment.value : this.comment,
      penalty: data.penalty.present ? data.penalty.value : this.penalty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimeRecord(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('milliseconds: $milliseconds, ')
          ..write('scramble: $scramble, ')
          ..write('date: $date, ')
          ..write('comment: $comment, ')
          ..write('penalty: $penalty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    categoryId,
    milliseconds,
    scramble,
    date,
    comment,
    penalty,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeRecord &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.milliseconds == this.milliseconds &&
          other.scramble == this.scramble &&
          other.date == this.date &&
          other.comment == this.comment &&
          other.penalty == this.penalty);
}

class TimeRecordsCompanion extends UpdateCompanion<TimeRecord> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<int> milliseconds;
  final Value<String> scramble;
  final Value<String> date;
  final Value<String?> comment;
  final Value<int> penalty;
  const TimeRecordsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.milliseconds = const Value.absent(),
    this.scramble = const Value.absent(),
    this.date = const Value.absent(),
    this.comment = const Value.absent(),
    this.penalty = const Value.absent(),
  });
  TimeRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required int milliseconds,
    required String scramble,
    required String date,
    this.comment = const Value.absent(),
    this.penalty = const Value.absent(),
  }) : categoryId = Value(categoryId),
       milliseconds = Value(milliseconds),
       scramble = Value(scramble),
       date = Value(date);
  static Insertable<TimeRecord> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<int>? milliseconds,
    Expression<String>? scramble,
    Expression<String>? date,
    Expression<String>? comment,
    Expression<int>? penalty,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (milliseconds != null) 'milliseconds': milliseconds,
      if (scramble != null) 'scramble': scramble,
      if (date != null) 'date': date,
      if (comment != null) 'comment': comment,
      if (penalty != null) 'penalty': penalty,
    });
  }

  TimeRecordsCompanion copyWith({
    Value<int>? id,
    Value<int>? categoryId,
    Value<int>? milliseconds,
    Value<String>? scramble,
    Value<String>? date,
    Value<String?>? comment,
    Value<int>? penalty,
  }) {
    return TimeRecordsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      milliseconds: milliseconds ?? this.milliseconds,
      scramble: scramble ?? this.scramble,
      date: date ?? this.date,
      comment: comment ?? this.comment,
      penalty: penalty ?? this.penalty,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (milliseconds.present) {
      map['milliseconds'] = Variable<int>(milliseconds.value);
    }
    if (scramble.present) {
      map['scramble'] = Variable<String>(scramble.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (penalty.present) {
      map['penalty'] = Variable<int>(penalty.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeRecordsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('milliseconds: $milliseconds, ')
          ..write('scramble: $scramble, ')
          ..write('date: $date, ')
          ..write('comment: $comment, ')
          ..write('penalty: $penalty')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CubeTypesTable cubeTypes = $CubeTypesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TimeRecordsTable timeRecords = $TimeRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cubeTypes,
    categories,
    timeRecords,
  ];
}

typedef $$CubeTypesTableCreateCompanionBuilder =
    CubeTypesCompanion Function({Value<int> id, required String type});
typedef $$CubeTypesTableUpdateCompanionBuilder =
    CubeTypesCompanion Function({Value<int> id, Value<String> type});

final class $$CubeTypesTableReferences
    extends BaseReferences<_$AppDatabase, $CubeTypesTable, CubeType> {
  $$CubeTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CategoriesTable, List<Category>>
  _categoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.categories,
    aliasName: $_aliasNameGenerator(db.cubeTypes.id, db.categories.cubeTypeId),
  );

  $$CategoriesTableProcessedTableManager get categoriesRefs {
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.cubeTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_categoriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CubeTypesTableFilterComposer
    extends Composer<_$AppDatabase, $CubeTypesTable> {
  $$CubeTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> categoriesRefs(
    Expression<bool> Function($$CategoriesTableFilterComposer f) f,
  ) {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.cubeTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CubeTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $CubeTypesTable> {
  $$CubeTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CubeTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CubeTypesTable> {
  $$CubeTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  Expression<T> categoriesRefs<T extends Object>(
    Expression<T> Function($$CategoriesTableAnnotationComposer a) f,
  ) {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.cubeTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CubeTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CubeTypesTable,
          CubeType,
          $$CubeTypesTableFilterComposer,
          $$CubeTypesTableOrderingComposer,
          $$CubeTypesTableAnnotationComposer,
          $$CubeTypesTableCreateCompanionBuilder,
          $$CubeTypesTableUpdateCompanionBuilder,
          (CubeType, $$CubeTypesTableReferences),
          CubeType,
          PrefetchHooks Function({bool categoriesRefs})
        > {
  $$CubeTypesTableTableManager(_$AppDatabase db, $CubeTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CubeTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CubeTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CubeTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> type = const Value.absent(),
              }) => CubeTypesCompanion(id: id, type: type),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String type}) =>
                  CubeTypesCompanion.insert(id: id, type: type),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CubeTypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({categoriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (categoriesRefs) db.categories],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (categoriesRefs)
                    await $_getPrefetchedData<
                      CubeType,
                      $CubeTypesTable,
                      Category
                    >(
                      currentTable: table,
                      referencedTable: $$CubeTypesTableReferences
                          ._categoriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CubeTypesTableReferences(
                            db,
                            table,
                            p0,
                          ).categoriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.cubeTypeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CubeTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CubeTypesTable,
      CubeType,
      $$CubeTypesTableFilterComposer,
      $$CubeTypesTableOrderingComposer,
      $$CubeTypesTableAnnotationComposer,
      $$CubeTypesTableCreateCompanionBuilder,
      $$CubeTypesTableUpdateCompanionBuilder,
      (CubeType, $$CubeTypesTableReferences),
      CubeType,
      PrefetchHooks Function({bool categoriesRefs})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required String name,
      required int cubeTypeId,
      Value<int?> shortestTime,
      Value<int?> mean,
      Value<int?> m_2,
      Value<int?> deviation,
      Value<int?> count,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> cubeTypeId,
      Value<int?> shortestTime,
      Value<int?> mean,
      Value<int?> m_2,
      Value<int?> deviation,
      Value<int?> count,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CubeTypesTable _cubeTypeIdTable(_$AppDatabase db) =>
      db.cubeTypes.createAlias(
        $_aliasNameGenerator(db.categories.cubeTypeId, db.cubeTypes.id),
      );

  $$CubeTypesTableProcessedTableManager get cubeTypeId {
    final $_column = $_itemColumn<int>('cube_type_id')!;

    final manager = $$CubeTypesTableTableManager(
      $_db,
      $_db.cubeTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cubeTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TimeRecordsTable, List<TimeRecord>>
  _timeRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timeRecords,
    aliasName: $_aliasNameGenerator(
      db.categories.id,
      db.timeRecords.categoryId,
    ),
  );

  $$TimeRecordsTableProcessedTableManager get timeRecordsRefs {
    final manager = $$TimeRecordsTableTableManager(
      $_db,
      $_db.timeRecords,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_timeRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shortestTime => $composableBuilder(
    column: $table.shortestTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mean => $composableBuilder(
    column: $table.mean,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get m_2 => $composableBuilder(
    column: $table.m_2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deviation => $composableBuilder(
    column: $table.deviation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  $$CubeTypesTableFilterComposer get cubeTypeId {
    final $$CubeTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cubeTypeId,
      referencedTable: $db.cubeTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CubeTypesTableFilterComposer(
            $db: $db,
            $table: $db.cubeTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> timeRecordsRefs(
    Expression<bool> Function($$TimeRecordsTableFilterComposer f) f,
  ) {
    final $$TimeRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timeRecords,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimeRecordsTableFilterComposer(
            $db: $db,
            $table: $db.timeRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shortestTime => $composableBuilder(
    column: $table.shortestTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mean => $composableBuilder(
    column: $table.mean,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get m_2 => $composableBuilder(
    column: $table.m_2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deviation => $composableBuilder(
    column: $table.deviation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  $$CubeTypesTableOrderingComposer get cubeTypeId {
    final $$CubeTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cubeTypeId,
      referencedTable: $db.cubeTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CubeTypesTableOrderingComposer(
            $db: $db,
            $table: $db.cubeTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get shortestTime => $composableBuilder(
    column: $table.shortestTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mean =>
      $composableBuilder(column: $table.mean, builder: (column) => column);

  GeneratedColumn<int> get m_2 =>
      $composableBuilder(column: $table.m_2, builder: (column) => column);

  GeneratedColumn<int> get deviation =>
      $composableBuilder(column: $table.deviation, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  $$CubeTypesTableAnnotationComposer get cubeTypeId {
    final $$CubeTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cubeTypeId,
      referencedTable: $db.cubeTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CubeTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.cubeTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> timeRecordsRefs<T extends Object>(
    Expression<T> Function($$TimeRecordsTableAnnotationComposer a) f,
  ) {
    final $$TimeRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timeRecords,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimeRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.timeRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool cubeTypeId, bool timeRecordsRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> cubeTypeId = const Value.absent(),
                Value<int?> shortestTime = const Value.absent(),
                Value<int?> mean = const Value.absent(),
                Value<int?> m_2 = const Value.absent(),
                Value<int?> deviation = const Value.absent(),
                Value<int?> count = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                cubeTypeId: cubeTypeId,
                shortestTime: shortestTime,
                mean: mean,
                m_2: m_2,
                deviation: deviation,
                count: count,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int cubeTypeId,
                Value<int?> shortestTime = const Value.absent(),
                Value<int?> mean = const Value.absent(),
                Value<int?> m_2 = const Value.absent(),
                Value<int?> deviation = const Value.absent(),
                Value<int?> count = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                cubeTypeId: cubeTypeId,
                shortestTime: shortestTime,
                mean: mean,
                m_2: m_2,
                deviation: deviation,
                count: count,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({cubeTypeId = false, timeRecordsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (timeRecordsRefs) db.timeRecords,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (cubeTypeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.cubeTypeId,
                                    referencedTable: $$CategoriesTableReferences
                                        ._cubeTypeIdTable(db),
                                    referencedColumn:
                                        $$CategoriesTableReferences
                                            ._cubeTypeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (timeRecordsRefs)
                        await $_getPrefetchedData<
                          Category,
                          $CategoriesTable,
                          TimeRecord
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._timeRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).timeRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool cubeTypeId, bool timeRecordsRefs})
    >;
typedef $$TimeRecordsTableCreateCompanionBuilder =
    TimeRecordsCompanion Function({
      Value<int> id,
      required int categoryId,
      required int milliseconds,
      required String scramble,
      required String date,
      Value<String?> comment,
      Value<int> penalty,
    });
typedef $$TimeRecordsTableUpdateCompanionBuilder =
    TimeRecordsCompanion Function({
      Value<int> id,
      Value<int> categoryId,
      Value<int> milliseconds,
      Value<String> scramble,
      Value<String> date,
      Value<String?> comment,
      Value<int> penalty,
    });

final class $$TimeRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $TimeRecordsTable, TimeRecord> {
  $$TimeRecordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.timeRecords.categoryId, db.categories.id),
      );

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TimeRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $TimeRecordsTable> {
  $$TimeRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get milliseconds => $composableBuilder(
    column: $table.milliseconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scramble => $composableBuilder(
    column: $table.scramble,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get penalty => $composableBuilder(
    column: $table.penalty,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimeRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $TimeRecordsTable> {
  $$TimeRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get milliseconds => $composableBuilder(
    column: $table.milliseconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scramble => $composableBuilder(
    column: $table.scramble,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get penalty => $composableBuilder(
    column: $table.penalty,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimeRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimeRecordsTable> {
  $$TimeRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get milliseconds => $composableBuilder(
    column: $table.milliseconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scramble =>
      $composableBuilder(column: $table.scramble, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<int> get penalty =>
      $composableBuilder(column: $table.penalty, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimeRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimeRecordsTable,
          TimeRecord,
          $$TimeRecordsTableFilterComposer,
          $$TimeRecordsTableOrderingComposer,
          $$TimeRecordsTableAnnotationComposer,
          $$TimeRecordsTableCreateCompanionBuilder,
          $$TimeRecordsTableUpdateCompanionBuilder,
          (TimeRecord, $$TimeRecordsTableReferences),
          TimeRecord,
          PrefetchHooks Function({bool categoryId})
        > {
  $$TimeRecordsTableTableManager(_$AppDatabase db, $TimeRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimeRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimeRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimeRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int> milliseconds = const Value.absent(),
                Value<String> scramble = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int> penalty = const Value.absent(),
              }) => TimeRecordsCompanion(
                id: id,
                categoryId: categoryId,
                milliseconds: milliseconds,
                scramble: scramble,
                date: date,
                comment: comment,
                penalty: penalty,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int categoryId,
                required int milliseconds,
                required String scramble,
                required String date,
                Value<String?> comment = const Value.absent(),
                Value<int> penalty = const Value.absent(),
              }) => TimeRecordsCompanion.insert(
                id: id,
                categoryId: categoryId,
                milliseconds: milliseconds,
                scramble: scramble,
                date: date,
                comment: comment,
                penalty: penalty,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TimeRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable: $$TimeRecordsTableReferences
                                    ._categoryIdTable(db),
                                referencedColumn: $$TimeRecordsTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TimeRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimeRecordsTable,
      TimeRecord,
      $$TimeRecordsTableFilterComposer,
      $$TimeRecordsTableOrderingComposer,
      $$TimeRecordsTableAnnotationComposer,
      $$TimeRecordsTableCreateCompanionBuilder,
      $$TimeRecordsTableUpdateCompanionBuilder,
      (TimeRecord, $$TimeRecordsTableReferences),
      TimeRecord,
      PrefetchHooks Function({bool categoryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CubeTypesTableTableManager get cubeTypes =>
      $$CubeTypesTableTableManager(_db, _db.cubeTypes);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$TimeRecordsTableTableManager get timeRecords =>
      $$TimeRecordsTableTableManager(_db, _db.timeRecords);
}
