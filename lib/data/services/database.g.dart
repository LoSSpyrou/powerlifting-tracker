// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LiftsTable extends Lifts with TableInfo<$LiftsTable, Lift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LiftsTable(this.attachedDatabase, [this._alias]);
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
  @override
  late final GeneratedColumnWithTypeConverter<LiftType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LiftType>($LiftsTable.$convertertype);
  static const VerificationMeta _customNameMeta = const VerificationMeta(
    'customName',
  );
  @override
  late final GeneratedColumn<String> customName = GeneratedColumn<String>(
    'custom_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, type, customName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lifts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Lift> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('custom_name')) {
      context.handle(
        _customNameMeta,
        customName.isAcceptableOrUnknown(data['custom_name']!, _customNameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lift(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: $LiftsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      customName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_name'],
      ),
    );
  }

  @override
  $LiftsTable createAlias(String alias) {
    return $LiftsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LiftType, String, String> $convertertype =
      const EnumNameConverter<LiftType>(LiftType.values);
}

class Lift extends DataClass implements Insertable<Lift> {
  final int id;
  final LiftType type;
  final String? customName;
  const Lift({required this.id, required this.type, this.customName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['type'] = Variable<String>($LiftsTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || customName != null) {
      map['custom_name'] = Variable<String>(customName);
    }
    return map;
  }

  LiftsCompanion toCompanion(bool nullToAbsent) {
    return LiftsCompanion(
      id: Value(id),
      type: Value(type),
      customName: customName == null && nullToAbsent
          ? const Value.absent()
          : Value(customName),
    );
  }

  factory Lift.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lift(
      id: serializer.fromJson<int>(json['id']),
      type: $LiftsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      customName: serializer.fromJson<String?>(json['customName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(
        $LiftsTable.$convertertype.toJson(type),
      ),
      'customName': serializer.toJson<String?>(customName),
    };
  }

  Lift copyWith({
    int? id,
    LiftType? type,
    Value<String?> customName = const Value.absent(),
  }) => Lift(
    id: id ?? this.id,
    type: type ?? this.type,
    customName: customName.present ? customName.value : this.customName,
  );
  Lift copyWithCompanion(LiftsCompanion data) {
    return Lift(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      customName: data.customName.present
          ? data.customName.value
          : this.customName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lift(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('customName: $customName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, customName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lift &&
          other.id == this.id &&
          other.type == this.type &&
          other.customName == this.customName);
}

class LiftsCompanion extends UpdateCompanion<Lift> {
  final Value<int> id;
  final Value<LiftType> type;
  final Value<String?> customName;
  const LiftsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.customName = const Value.absent(),
  });
  LiftsCompanion.insert({
    this.id = const Value.absent(),
    required LiftType type,
    this.customName = const Value.absent(),
  }) : type = Value(type);
  static Insertable<Lift> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? customName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (customName != null) 'custom_name': customName,
    });
  }

  LiftsCompanion copyWith({
    Value<int>? id,
    Value<LiftType>? type,
    Value<String?>? customName,
  }) {
    return LiftsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      customName: customName ?? this.customName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $LiftsTable.$convertertype.toSql(type.value),
      );
    }
    if (customName.present) {
      map['custom_name'] = Variable<String>(customName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LiftsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('customName: $customName')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Session> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final int id;
  final DateTime date;
  const Session({required this.id, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(id: Value(id), date: Value(date));
  }

  factory Session.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Session copyWith({int? id, DateTime? date}) =>
      Session(id: id ?? this.id, date: date ?? this.date);
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session && other.id == this.id && other.date == this.date);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> id;
  final Value<DateTime> date;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
  }) : date = Value(date);
  static Insertable<Session> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
    });
  }

  SessionsCompanion copyWith({Value<int>? id, Value<DateTime>? date}) {
    return SessionsCompanion(id: id ?? this.id, date: date ?? this.date);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $SetEntriesTable extends SetEntries
    with TableInfo<$SetEntriesTable, SetEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetEntriesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sessions (id)',
    ),
  );
  static const VerificationMeta _liftIdMeta = const VerificationMeta('liftId');
  @override
  late final GeneratedColumn<int> liftId = GeneratedColumn<int>(
    'lift_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lifts (id)',
    ),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<double> rpe = GeneratedColumn<double>(
    'rpe',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<WeightUnit, String> unit =
      GeneratedColumn<String>(
        'unit',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<WeightUnit>($SetEntriesTable.$converterunit);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    liftId,
    weight,
    reps,
    rpe,
    unit,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'set_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SetEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('lift_id')) {
      context.handle(
        _liftIdMeta,
        liftId.isAcceptableOrUnknown(data['lift_id']!, _liftIdMeta),
      );
    } else if (isInserting) {
      context.missing(_liftIdMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('rpe')) {
      context.handle(
        _rpeMeta,
        rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_id'],
      )!,
      liftId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lift_id'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      )!,
      rpe: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rpe'],
      ),
      unit: $SetEntriesTable.$converterunit.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}unit'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SetEntriesTable createAlias(String alias) {
    return $SetEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WeightUnit, String, String> $converterunit =
      const EnumNameConverter<WeightUnit>(WeightUnit.values);
}

class SetEntry extends DataClass implements Insertable<SetEntry> {
  final int id;
  final int sessionId;
  final int liftId;
  final double weight;
  final int reps;
  final double? rpe;
  final WeightUnit unit;
  final DateTime createdAt;
  const SetEntry({
    required this.id,
    required this.sessionId,
    required this.liftId,
    required this.weight,
    required this.reps,
    this.rpe,
    required this.unit,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    map['lift_id'] = Variable<int>(liftId);
    map['weight'] = Variable<double>(weight);
    map['reps'] = Variable<int>(reps);
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<double>(rpe);
    }
    {
      map['unit'] = Variable<String>(
        $SetEntriesTable.$converterunit.toSql(unit),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SetEntriesCompanion toCompanion(bool nullToAbsent) {
    return SetEntriesCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      liftId: Value(liftId),
      weight: Value(weight),
      reps: Value(reps),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      unit: Value(unit),
      createdAt: Value(createdAt),
    );
  }

  factory SetEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetEntry(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      liftId: serializer.fromJson<int>(json['liftId']),
      weight: serializer.fromJson<double>(json['weight']),
      reps: serializer.fromJson<int>(json['reps']),
      rpe: serializer.fromJson<double?>(json['rpe']),
      unit: $SetEntriesTable.$converterunit.fromJson(
        serializer.fromJson<String>(json['unit']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'liftId': serializer.toJson<int>(liftId),
      'weight': serializer.toJson<double>(weight),
      'reps': serializer.toJson<int>(reps),
      'rpe': serializer.toJson<double?>(rpe),
      'unit': serializer.toJson<String>(
        $SetEntriesTable.$converterunit.toJson(unit),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SetEntry copyWith({
    int? id,
    int? sessionId,
    int? liftId,
    double? weight,
    int? reps,
    Value<double?> rpe = const Value.absent(),
    WeightUnit? unit,
    DateTime? createdAt,
  }) => SetEntry(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    liftId: liftId ?? this.liftId,
    weight: weight ?? this.weight,
    reps: reps ?? this.reps,
    rpe: rpe.present ? rpe.value : this.rpe,
    unit: unit ?? this.unit,
    createdAt: createdAt ?? this.createdAt,
  );
  SetEntry copyWithCompanion(SetEntriesCompanion data) {
    return SetEntry(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      liftId: data.liftId.present ? data.liftId.value : this.liftId,
      weight: data.weight.present ? data.weight.value : this.weight,
      reps: data.reps.present ? data.reps.value : this.reps,
      rpe: data.rpe.present ? data.rpe.value : this.rpe,
      unit: data.unit.present ? data.unit.value : this.unit,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetEntry(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('liftId: $liftId, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('rpe: $rpe, ')
          ..write('unit: $unit, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sessionId, liftId, weight, reps, rpe, unit, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetEntry &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.liftId == this.liftId &&
          other.weight == this.weight &&
          other.reps == this.reps &&
          other.rpe == this.rpe &&
          other.unit == this.unit &&
          other.createdAt == this.createdAt);
}

class SetEntriesCompanion extends UpdateCompanion<SetEntry> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<int> liftId;
  final Value<double> weight;
  final Value<int> reps;
  final Value<double?> rpe;
  final Value<WeightUnit> unit;
  final Value<DateTime> createdAt;
  const SetEntriesCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.liftId = const Value.absent(),
    this.weight = const Value.absent(),
    this.reps = const Value.absent(),
    this.rpe = const Value.absent(),
    this.unit = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SetEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    required int liftId,
    required double weight,
    required int reps,
    this.rpe = const Value.absent(),
    required WeightUnit unit,
    this.createdAt = const Value.absent(),
  }) : sessionId = Value(sessionId),
       liftId = Value(liftId),
       weight = Value(weight),
       reps = Value(reps),
       unit = Value(unit);
  static Insertable<SetEntry> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<int>? liftId,
    Expression<double>? weight,
    Expression<int>? reps,
    Expression<double>? rpe,
    Expression<String>? unit,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (liftId != null) 'lift_id': liftId,
      if (weight != null) 'weight': weight,
      if (reps != null) 'reps': reps,
      if (rpe != null) 'rpe': rpe,
      if (unit != null) 'unit': unit,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SetEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? sessionId,
    Value<int>? liftId,
    Value<double>? weight,
    Value<int>? reps,
    Value<double?>? rpe,
    Value<WeightUnit>? unit,
    Value<DateTime>? createdAt,
  }) {
    return SetEntriesCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      liftId: liftId ?? this.liftId,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      rpe: rpe ?? this.rpe,
      unit: unit ?? this.unit,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (liftId.present) {
      map['lift_id'] = Variable<int>(liftId.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<double>(rpe.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(
        $SetEntriesTable.$converterunit.toSql(unit.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetEntriesCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('liftId: $liftId, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('rpe: $rpe, ')
          ..write('unit: $unit, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LiftsTable lifts = $LiftsTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $SetEntriesTable setEntries = $SetEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    lifts,
    sessions,
    setEntries,
  ];
}

typedef $$LiftsTableCreateCompanionBuilder =
    LiftsCompanion Function({
      Value<int> id,
      required LiftType type,
      Value<String?> customName,
    });
typedef $$LiftsTableUpdateCompanionBuilder =
    LiftsCompanion Function({
      Value<int> id,
      Value<LiftType> type,
      Value<String?> customName,
    });

final class $$LiftsTableReferences
    extends BaseReferences<_$AppDatabase, $LiftsTable, Lift> {
  $$LiftsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SetEntriesTable, List<SetEntry>>
  _setEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.setEntries,
    aliasName: 'lifts__id__set_entries__lift_id',
  );

  $$SetEntriesTableProcessedTableManager get setEntriesRefs {
    final manager = $$SetEntriesTableTableManager(
      $_db,
      $_db.setEntries,
    ).filter((f) => f.liftId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_setEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LiftsTableFilterComposer extends Composer<_$AppDatabase, $LiftsTable> {
  $$LiftsTableFilterComposer({
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

  ColumnWithTypeConverterFilters<LiftType, LiftType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> setEntriesRefs(
    Expression<bool> Function($$SetEntriesTableFilterComposer f) f,
  ) {
    final $$SetEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setEntries,
      getReferencedColumn: (t) => t.liftId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetEntriesTableFilterComposer(
            $db: $db,
            $table: $db.setEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LiftsTableOrderingComposer
    extends Composer<_$AppDatabase, $LiftsTable> {
  $$LiftsTableOrderingComposer({
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

  ColumnOrderings<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LiftsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LiftsTable> {
  $$LiftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LiftType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => column,
  );

  Expression<T> setEntriesRefs<T extends Object>(
    Expression<T> Function($$SetEntriesTableAnnotationComposer a) f,
  ) {
    final $$SetEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setEntries,
      getReferencedColumn: (t) => t.liftId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.setEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LiftsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LiftsTable,
          Lift,
          $$LiftsTableFilterComposer,
          $$LiftsTableOrderingComposer,
          $$LiftsTableAnnotationComposer,
          $$LiftsTableCreateCompanionBuilder,
          $$LiftsTableUpdateCompanionBuilder,
          (Lift, $$LiftsTableReferences),
          Lift,
          PrefetchHooks Function({bool setEntriesRefs})
        > {
  $$LiftsTableTableManager(_$AppDatabase db, $LiftsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LiftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LiftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LiftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<LiftType> type = const Value.absent(),
                Value<String?> customName = const Value.absent(),
              }) => LiftsCompanion(id: id, type: type, customName: customName),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required LiftType type,
                Value<String?> customName = const Value.absent(),
              }) => LiftsCompanion.insert(
                id: id,
                type: type,
                customName: customName,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LiftsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({setEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (setEntriesRefs) db.setEntries],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (setEntriesRefs)
                    await $_getPrefetchedData<Lift, $LiftsTable, SetEntry>(
                      currentTable: table,
                      referencedTable: $$LiftsTableReferences
                          ._setEntriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LiftsTableReferences(db, table, p0).setEntriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.liftId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LiftsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LiftsTable,
      Lift,
      $$LiftsTableFilterComposer,
      $$LiftsTableOrderingComposer,
      $$LiftsTableAnnotationComposer,
      $$LiftsTableCreateCompanionBuilder,
      $$LiftsTableUpdateCompanionBuilder,
      (Lift, $$LiftsTableReferences),
      Lift,
      PrefetchHooks Function({bool setEntriesRefs})
    >;
typedef $$SessionsTableCreateCompanionBuilder =
    SessionsCompanion Function({Value<int> id, required DateTime date});
typedef $$SessionsTableUpdateCompanionBuilder =
    SessionsCompanion Function({Value<int> id, Value<DateTime> date});

final class $$SessionsTableReferences
    extends BaseReferences<_$AppDatabase, $SessionsTable, Session> {
  $$SessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SetEntriesTable, List<SetEntry>>
  _setEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.setEntries,
    aliasName: 'sessions__id__set_entries__session_id',
  );

  $$SetEntriesTableProcessedTableManager get setEntriesRefs {
    final manager = $$SetEntriesTableTableManager(
      $_db,
      $_db.setEntries,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_setEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> setEntriesRefs(
    Expression<bool> Function($$SetEntriesTableFilterComposer f) f,
  ) {
    final $$SetEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setEntries,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetEntriesTableFilterComposer(
            $db: $db,
            $table: $db.setEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  Expression<T> setEntriesRefs<T extends Object>(
    Expression<T> Function($$SetEntriesTableAnnotationComposer a) f,
  ) {
    final $$SetEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setEntries,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.setEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionsTable,
          Session,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (Session, $$SessionsTableReferences),
          Session,
          PrefetchHooks Function({bool setEntriesRefs})
        > {
  $$SessionsTableTableManager(_$AppDatabase db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => SessionsCompanion(id: id, date: date),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
              }) => SessionsCompanion.insert(id: id, date: date),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({setEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (setEntriesRefs) db.setEntries],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (setEntriesRefs)
                    await $_getPrefetchedData<
                      Session,
                      $SessionsTable,
                      SetEntry
                    >(
                      currentTable: table,
                      referencedTable: $$SessionsTableReferences
                          ._setEntriesRefsTable(db),
                      managerFromTypedResult: (p0) => $$SessionsTableReferences(
                        db,
                        table,
                        p0,
                      ).setEntriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sessionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionsTable,
      Session,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (Session, $$SessionsTableReferences),
      Session,
      PrefetchHooks Function({bool setEntriesRefs})
    >;
typedef $$SetEntriesTableCreateCompanionBuilder =
    SetEntriesCompanion Function({
      Value<int> id,
      required int sessionId,
      required int liftId,
      required double weight,
      required int reps,
      Value<double?> rpe,
      required WeightUnit unit,
      Value<DateTime> createdAt,
    });
typedef $$SetEntriesTableUpdateCompanionBuilder =
    SetEntriesCompanion Function({
      Value<int> id,
      Value<int> sessionId,
      Value<int> liftId,
      Value<double> weight,
      Value<int> reps,
      Value<double?> rpe,
      Value<WeightUnit> unit,
      Value<DateTime> createdAt,
    });

final class $$SetEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $SetEntriesTable, SetEntry> {
  $$SetEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.sessions.createAlias('set_entries__session_id__sessions__id');

  $$SessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<int>('session_id')!;

    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LiftsTable _liftIdTable(_$AppDatabase db) =>
      db.lifts.createAlias('set_entries__lift_id__lifts__id');

  $$LiftsTableProcessedTableManager get liftId {
    final $_column = $_itemColumn<int>('lift_id')!;

    final manager = $$LiftsTableTableManager(
      $_db,
      $_db.lifts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_liftIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SetEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SetEntriesTable> {
  $$SetEntriesTableFilterComposer({
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

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WeightUnit, WeightUnit, String> get unit =>
      $composableBuilder(
        column: $table.unit,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SessionsTableFilterComposer get sessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LiftsTableFilterComposer get liftId {
    final $$LiftsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.liftId,
      referencedTable: $db.lifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LiftsTableFilterComposer(
            $db: $db,
            $table: $db.lifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SetEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SetEntriesTable> {
  $$SetEntriesTableOrderingComposer({
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

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SessionsTableOrderingComposer get sessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableOrderingComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LiftsTableOrderingComposer get liftId {
    final $$LiftsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.liftId,
      referencedTable: $db.lifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LiftsTableOrderingComposer(
            $db: $db,
            $table: $db.lifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SetEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SetEntriesTable> {
  $$SetEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WeightUnit, String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SessionsTableAnnotationComposer get sessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LiftsTableAnnotationComposer get liftId {
    final $$LiftsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.liftId,
      referencedTable: $db.lifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LiftsTableAnnotationComposer(
            $db: $db,
            $table: $db.lifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SetEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SetEntriesTable,
          SetEntry,
          $$SetEntriesTableFilterComposer,
          $$SetEntriesTableOrderingComposer,
          $$SetEntriesTableAnnotationComposer,
          $$SetEntriesTableCreateCompanionBuilder,
          $$SetEntriesTableUpdateCompanionBuilder,
          (SetEntry, $$SetEntriesTableReferences),
          SetEntry,
          PrefetchHooks Function({bool sessionId, bool liftId})
        > {
  $$SetEntriesTableTableManager(_$AppDatabase db, $SetEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sessionId = const Value.absent(),
                Value<int> liftId = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<double?> rpe = const Value.absent(),
                Value<WeightUnit> unit = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SetEntriesCompanion(
                id: id,
                sessionId: sessionId,
                liftId: liftId,
                weight: weight,
                reps: reps,
                rpe: rpe,
                unit: unit,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sessionId,
                required int liftId,
                required double weight,
                required int reps,
                Value<double?> rpe = const Value.absent(),
                required WeightUnit unit,
                Value<DateTime> createdAt = const Value.absent(),
              }) => SetEntriesCompanion.insert(
                id: id,
                sessionId: sessionId,
                liftId: liftId,
                weight: weight,
                reps: reps,
                rpe: rpe,
                unit: unit,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SetEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sessionId = false, liftId = false}) {
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
                    if (sessionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sessionId,
                                referencedTable: $$SetEntriesTableReferences
                                    ._sessionIdTable(db),
                                referencedColumn: $$SetEntriesTableReferences
                                    ._sessionIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (liftId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.liftId,
                                referencedTable: $$SetEntriesTableReferences
                                    ._liftIdTable(db),
                                referencedColumn: $$SetEntriesTableReferences
                                    ._liftIdTable(db)
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

typedef $$SetEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SetEntriesTable,
      SetEntry,
      $$SetEntriesTableFilterComposer,
      $$SetEntriesTableOrderingComposer,
      $$SetEntriesTableAnnotationComposer,
      $$SetEntriesTableCreateCompanionBuilder,
      $$SetEntriesTableUpdateCompanionBuilder,
      (SetEntry, $$SetEntriesTableReferences),
      SetEntry,
      PrefetchHooks Function({bool sessionId, bool liftId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LiftsTableTableManager get lifts =>
      $$LiftsTableTableManager(_db, _db.lifts);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$SetEntriesTableTableManager get setEntries =>
      $$SetEntriesTableTableManager(_db, _db.setEntries);
}
