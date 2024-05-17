// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $WaitersTable extends Waiters with TableInfo<$WaitersTable, Waiter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaitersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'waiters';
  @override
  VerificationContext validateIntegrity(Insertable<Waiter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Waiter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Waiter(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $WaitersTable createAlias(String alias) {
    return $WaitersTable(attachedDatabase, alias);
  }
}

class Waiter extends DataClass implements Insertable<Waiter> {
  final int? id;
  final String name;
  const Waiter({this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    return map;
  }

  WaitersCompanion toCompanion(bool nullToAbsent) {
    return WaitersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
    );
  }

  factory Waiter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Waiter(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Waiter copyWith({Value<int?> id = const Value.absent(), String? name}) =>
      Waiter(
        id: id.present ? id.value : this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Waiter(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Waiter && other.id == this.id && other.name == this.name);
}

class WaitersCompanion extends UpdateCompanion<Waiter> {
  final Value<int?> id;
  final Value<String> name;
  const WaitersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  WaitersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Waiter> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  WaitersCompanion copyWith({Value<int?>? id, Value<String>? name}) {
    return WaitersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaitersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PlacesTable extends Places with TableInfo<$PlacesTable, Place> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'places';
  @override
  VerificationContext validateIntegrity(Insertable<Place> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Place map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Place(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $PlacesTable createAlias(String alias) {
    return $PlacesTable(attachedDatabase, alias);
  }
}

class Place extends DataClass implements Insertable<Place> {
  final int? id;
  final String name;
  const Place({this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    return map;
  }

  PlacesCompanion toCompanion(bool nullToAbsent) {
    return PlacesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
    );
  }

  factory Place.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Place(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Place copyWith({Value<int?> id = const Value.absent(), String? name}) =>
      Place(
        id: id.present ? id.value : this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Place(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Place && other.id == this.id && other.name == this.name);
}

class PlacesCompanion extends UpdateCompanion<Place> {
  final Value<int?> id;
  final Value<String> name;
  const PlacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  PlacesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Place> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  PlacesCompanion copyWith({Value<int?>? id, Value<String>? name}) {
    return PlacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlacesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GoodsGroupsTable extends GoodsGroups
    with TableInfo<$GoodsGroupsTable, GoodsGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoodsGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<GroupType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<GroupType>($GoodsGroupsTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns => [id, title, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goods_groups';
  @override
  VerificationContext validateIntegrity(Insertable<GoodsGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoodsGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoodsGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: $GoodsGroupsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $GoodsGroupsTable createAlias(String alias) {
    return $GoodsGroupsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<GroupType, String, String> $convertertype =
      const EnumNameConverter<GroupType>(GroupType.values);
}

class GoodsGroup extends DataClass implements Insertable<GoodsGroup> {
  final int? id;
  final String title;
  final GroupType type;
  const GoodsGroup({this.id, required this.title, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['title'] = Variable<String>(title);
    {
      map['type'] =
          Variable<String>($GoodsGroupsTable.$convertertype.toSql(type));
    }
    return map;
  }

  GoodsGroupsCompanion toCompanion(bool nullToAbsent) {
    return GoodsGroupsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      type: Value(type),
    );
  }

  factory GoodsGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoodsGroup(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: $GoodsGroupsTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer
          .toJson<String>($GoodsGroupsTable.$convertertype.toJson(type)),
    };
  }

  GoodsGroup copyWith(
          {Value<int?> id = const Value.absent(),
          String? title,
          GroupType? type}) =>
      GoodsGroup(
        id: id.present ? id.value : this.id,
        title: title ?? this.title,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('GoodsGroup(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoodsGroup &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type);
}

class GoodsGroupsCompanion extends UpdateCompanion<GoodsGroup> {
  final Value<int?> id;
  final Value<String> title;
  final Value<GroupType> type;
  const GoodsGroupsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
  });
  GoodsGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required GroupType type,
  })  : title = Value(title),
        type = Value(type);
  static Insertable<GoodsGroup> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
    });
  }

  GoodsGroupsCompanion copyWith(
      {Value<int?>? id, Value<String>? title, Value<GroupType>? type}) {
    return GoodsGroupsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($GoodsGroupsTable.$convertertype.toSql(type.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoodsGroupsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $GoodsItemsTable extends GoodsItems
    with TableInfo<$GoodsItemsTable, GoodsItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoodsItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<int> group = GeneratedColumn<int>(
      'group', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES goods_groups (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, title, price, group];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goods_items';
  @override
  VerificationContext validateIntegrity(Insertable<GoodsItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('group')) {
      context.handle(
          _groupMeta, group.isAcceptableOrUnknown(data['group']!, _groupMeta));
    } else if (isInserting) {
      context.missing(_groupMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoodsItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoodsItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      group: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group'])!,
    );
  }

  @override
  $GoodsItemsTable createAlias(String alias) {
    return $GoodsItemsTable(attachedDatabase, alias);
  }
}

class GoodsItem extends DataClass implements Insertable<GoodsItem> {
  final int? id;
  final String title;
  final double price;
  final int group;
  const GoodsItem(
      {this.id, required this.title, required this.price, required this.group});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['title'] = Variable<String>(title);
    map['price'] = Variable<double>(price);
    map['group'] = Variable<int>(group);
    return map;
  }

  GoodsItemsCompanion toCompanion(bool nullToAbsent) {
    return GoodsItemsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      price: Value(price),
      group: Value(group),
    );
  }

  factory GoodsItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoodsItem(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      price: serializer.fromJson<double>(json['price']),
      group: serializer.fromJson<int>(json['group']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String>(title),
      'price': serializer.toJson<double>(price),
      'group': serializer.toJson<int>(group),
    };
  }

  GoodsItem copyWith(
          {Value<int?> id = const Value.absent(),
          String? title,
          double? price,
          int? group}) =>
      GoodsItem(
        id: id.present ? id.value : this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        group: group ?? this.group,
      );
  @override
  String toString() {
    return (StringBuffer('GoodsItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('group: $group')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, price, group);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoodsItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.price == this.price &&
          other.group == this.group);
}

class GoodsItemsCompanion extends UpdateCompanion<GoodsItem> {
  final Value<int?> id;
  final Value<String> title;
  final Value<double> price;
  final Value<int> group;
  const GoodsItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
    this.group = const Value.absent(),
  });
  GoodsItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double price,
    required int group,
  })  : title = Value(title),
        price = Value(price),
        group = Value(group);
  static Insertable<GoodsItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? price,
    Expression<int>? group,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (group != null) 'group': group,
    });
  }

  GoodsItemsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? title,
      Value<double>? price,
      Value<int>? group}) {
    return GoodsItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      group: group ?? this.group,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (group.present) {
      map['group'] = Variable<int>(group.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoodsItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('group: $group')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _waiterMeta = const VerificationMeta('waiter');
  @override
  late final GeneratedColumn<int> waiter = GeneratedColumn<int>(
      'waiter', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES waiters (id)'));
  static const VerificationMeta _tableMeta = const VerificationMeta('table');
  @override
  late final GeneratedColumn<int> table = GeneratedColumn<int>(
      'table', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES places (id)'));
  static const VerificationMeta _closedMeta = const VerificationMeta('closed');
  @override
  late final GeneratedColumn<bool> closed = GeneratedColumn<bool>(
      'closed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("closed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, waiter, table, closed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('waiter')) {
      context.handle(_waiterMeta,
          waiter.isAcceptableOrUnknown(data['waiter']!, _waiterMeta));
    } else if (isInserting) {
      context.missing(_waiterMeta);
    }
    if (data.containsKey('table')) {
      context.handle(
          _tableMeta, table.isAcceptableOrUnknown(data['table']!, _tableMeta));
    } else if (isInserting) {
      context.missing(_tableMeta);
    }
    if (data.containsKey('closed')) {
      context.handle(_closedMeta,
          closed.isAcceptableOrUnknown(data['closed']!, _closedMeta));
    } else if (isInserting) {
      context.missing(_closedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      waiter: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}waiter'])!,
      table: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}table'])!,
      closed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}closed'])!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int? id;
  final int waiter;
  final int table;
  final bool closed;
  const Order(
      {this.id,
      required this.waiter,
      required this.table,
      required this.closed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['waiter'] = Variable<int>(waiter);
    map['table'] = Variable<int>(table);
    map['closed'] = Variable<bool>(closed);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      waiter: Value(waiter),
      table: Value(table),
      closed: Value(closed),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int?>(json['id']),
      waiter: serializer.fromJson<int>(json['waiter']),
      table: serializer.fromJson<int>(json['table']),
      closed: serializer.fromJson<bool>(json['closed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'waiter': serializer.toJson<int>(waiter),
      'table': serializer.toJson<int>(table),
      'closed': serializer.toJson<bool>(closed),
    };
  }

  Order copyWith(
          {Value<int?> id = const Value.absent(),
          int? waiter,
          int? table,
          bool? closed}) =>
      Order(
        id: id.present ? id.value : this.id,
        waiter: waiter ?? this.waiter,
        table: table ?? this.table,
        closed: closed ?? this.closed,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('waiter: $waiter, ')
          ..write('table: $table, ')
          ..write('closed: $closed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, waiter, table, closed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.waiter == this.waiter &&
          other.table == this.table &&
          other.closed == this.closed);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int?> id;
  final Value<int> waiter;
  final Value<int> table;
  final Value<bool> closed;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.waiter = const Value.absent(),
    this.table = const Value.absent(),
    this.closed = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required int waiter,
    required int table,
    required bool closed,
  })  : waiter = Value(waiter),
        table = Value(table),
        closed = Value(closed);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<int>? waiter,
    Expression<int>? table,
    Expression<bool>? closed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (waiter != null) 'waiter': waiter,
      if (table != null) 'table': table,
      if (closed != null) 'closed': closed,
    });
  }

  OrdersCompanion copyWith(
      {Value<int?>? id,
      Value<int>? waiter,
      Value<int>? table,
      Value<bool>? closed}) {
    return OrdersCompanion(
      id: id ?? this.id,
      waiter: waiter ?? this.waiter,
      table: table ?? this.table,
      closed: closed ?? this.closed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (waiter.present) {
      map['waiter'] = Variable<int>(waiter.value);
    }
    if (table.present) {
      map['table'] = Variable<int>(table.value);
    }
    if (closed.present) {
      map['closed'] = Variable<bool>(closed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('waiter: $waiter, ')
          ..write('table: $table, ')
          ..write('closed: $closed')
          ..write(')'))
        .toString();
  }
}

class $OrderItemsTable extends OrderItems
    with TableInfo<$OrderItemsTable, OrderItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES orders (id)'));
  static const VerificationMeta _goodItemMeta =
      const VerificationMeta('goodItem');
  @override
  late final GeneratedColumn<int> goodItem = GeneratedColumn<int>(
      'good_item', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES goods_items (id)'));
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, order, goodItem, count, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('good_item')) {
      context.handle(_goodItemMeta,
          goodItem.isAcceptableOrUnknown(data['good_item']!, _goodItemMeta));
    } else if (isInserting) {
      context.missing(_goodItemMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      goodItem: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}good_item'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $OrderItemsTable createAlias(String alias) {
    return $OrderItemsTable(attachedDatabase, alias);
  }
}

class OrderItem extends DataClass implements Insertable<OrderItem> {
  final int? id;
  final int order;
  final int goodItem;
  final int count;
  final double price;
  const OrderItem(
      {this.id,
      required this.order,
      required this.goodItem,
      required this.count,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['order'] = Variable<int>(order);
    map['good_item'] = Variable<int>(goodItem);
    map['count'] = Variable<int>(count);
    map['price'] = Variable<double>(price);
    return map;
  }

  OrderItemsCompanion toCompanion(bool nullToAbsent) {
    return OrderItemsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      order: Value(order),
      goodItem: Value(goodItem),
      count: Value(count),
      price: Value(price),
    );
  }

  factory OrderItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItem(
      id: serializer.fromJson<int?>(json['id']),
      order: serializer.fromJson<int>(json['order']),
      goodItem: serializer.fromJson<int>(json['goodItem']),
      count: serializer.fromJson<int>(json['count']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'order': serializer.toJson<int>(order),
      'goodItem': serializer.toJson<int>(goodItem),
      'count': serializer.toJson<int>(count),
      'price': serializer.toJson<double>(price),
    };
  }

  OrderItem copyWith(
          {Value<int?> id = const Value.absent(),
          int? order,
          int? goodItem,
          int? count,
          double? price}) =>
      OrderItem(
        id: id.present ? id.value : this.id,
        order: order ?? this.order,
        goodItem: goodItem ?? this.goodItem,
        count: count ?? this.count,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('OrderItem(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('goodItem: $goodItem, ')
          ..write('count: $count, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, order, goodItem, count, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItem &&
          other.id == this.id &&
          other.order == this.order &&
          other.goodItem == this.goodItem &&
          other.count == this.count &&
          other.price == this.price);
}

class OrderItemsCompanion extends UpdateCompanion<OrderItem> {
  final Value<int?> id;
  final Value<int> order;
  final Value<int> goodItem;
  final Value<int> count;
  final Value<double> price;
  const OrderItemsCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.goodItem = const Value.absent(),
    this.count = const Value.absent(),
    this.price = const Value.absent(),
  });
  OrderItemsCompanion.insert({
    this.id = const Value.absent(),
    required int order,
    required int goodItem,
    required int count,
    required double price,
  })  : order = Value(order),
        goodItem = Value(goodItem),
        count = Value(count),
        price = Value(price);
  static Insertable<OrderItem> custom({
    Expression<int>? id,
    Expression<int>? order,
    Expression<int>? goodItem,
    Expression<int>? count,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
      if (goodItem != null) 'good_item': goodItem,
      if (count != null) 'count': count,
      if (price != null) 'price': price,
    });
  }

  OrderItemsCompanion copyWith(
      {Value<int?>? id,
      Value<int>? order,
      Value<int>? goodItem,
      Value<int>? count,
      Value<double>? price}) {
    return OrderItemsCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      goodItem: goodItem ?? this.goodItem,
      count: count ?? this.count,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (goodItem.present) {
      map['good_item'] = Variable<int>(goodItem.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('goodItem: $goodItem, ')
          ..write('count: $count, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

abstract class _$MainDatabase extends GeneratedDatabase {
  _$MainDatabase(QueryExecutor e) : super(e);
  _$MainDatabaseManager get managers => _$MainDatabaseManager(this);
  late final $WaitersTable waiters = $WaitersTable(this);
  late final $PlacesTable places = $PlacesTable(this);
  late final $GoodsGroupsTable goodsGroups = $GoodsGroupsTable(this);
  late final $GoodsItemsTable goodsItems = $GoodsItemsTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $OrderItemsTable orderItems = $OrderItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [waiters, places, goodsGroups, goodsItems, orders, orderItems];
}

typedef $$WaitersTableInsertCompanionBuilder = WaitersCompanion Function({
  Value<int?> id,
  required String name,
});
typedef $$WaitersTableUpdateCompanionBuilder = WaitersCompanion Function({
  Value<int?> id,
  Value<String> name,
});

class $$WaitersTableTableManager extends RootTableManager<
    _$MainDatabase,
    $WaitersTable,
    Waiter,
    $$WaitersTableFilterComposer,
    $$WaitersTableOrderingComposer,
    $$WaitersTableProcessedTableManager,
    $$WaitersTableInsertCompanionBuilder,
    $$WaitersTableUpdateCompanionBuilder> {
  $$WaitersTableTableManager(_$MainDatabase db, $WaitersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WaitersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WaitersTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$WaitersTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              WaitersCompanion(
            id: id,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            required String name,
          }) =>
              WaitersCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$WaitersTableProcessedTableManager extends ProcessedTableManager<
    _$MainDatabase,
    $WaitersTable,
    Waiter,
    $$WaitersTableFilterComposer,
    $$WaitersTableOrderingComposer,
    $$WaitersTableProcessedTableManager,
    $$WaitersTableInsertCompanionBuilder,
    $$WaitersTableUpdateCompanionBuilder> {
  $$WaitersTableProcessedTableManager(super.$state);
}

class $$WaitersTableFilterComposer
    extends FilterComposer<_$MainDatabase, $WaitersTable> {
  $$WaitersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter ordersRefs(
      ComposableFilter Function($$OrdersTableFilterComposer f) f) {
    final $$OrdersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.orders,
        getReferencedColumn: (t) => t.waiter,
        builder: (joinBuilder, parentComposers) => $$OrdersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.orders, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$WaitersTableOrderingComposer
    extends OrderingComposer<_$MainDatabase, $WaitersTable> {
  $$WaitersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PlacesTableInsertCompanionBuilder = PlacesCompanion Function({
  Value<int?> id,
  required String name,
});
typedef $$PlacesTableUpdateCompanionBuilder = PlacesCompanion Function({
  Value<int?> id,
  Value<String> name,
});

class $$PlacesTableTableManager extends RootTableManager<
    _$MainDatabase,
    $PlacesTable,
    Place,
    $$PlacesTableFilterComposer,
    $$PlacesTableOrderingComposer,
    $$PlacesTableProcessedTableManager,
    $$PlacesTableInsertCompanionBuilder,
    $$PlacesTableUpdateCompanionBuilder> {
  $$PlacesTableTableManager(_$MainDatabase db, $PlacesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PlacesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PlacesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$PlacesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              PlacesCompanion(
            id: id,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            required String name,
          }) =>
              PlacesCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$PlacesTableProcessedTableManager extends ProcessedTableManager<
    _$MainDatabase,
    $PlacesTable,
    Place,
    $$PlacesTableFilterComposer,
    $$PlacesTableOrderingComposer,
    $$PlacesTableProcessedTableManager,
    $$PlacesTableInsertCompanionBuilder,
    $$PlacesTableUpdateCompanionBuilder> {
  $$PlacesTableProcessedTableManager(super.$state);
}

class $$PlacesTableFilterComposer
    extends FilterComposer<_$MainDatabase, $PlacesTable> {
  $$PlacesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter ordersRefs(
      ComposableFilter Function($$OrdersTableFilterComposer f) f) {
    final $$OrdersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.orders,
        getReferencedColumn: (t) => t.table,
        builder: (joinBuilder, parentComposers) => $$OrdersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.orders, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$PlacesTableOrderingComposer
    extends OrderingComposer<_$MainDatabase, $PlacesTable> {
  $$PlacesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$GoodsGroupsTableInsertCompanionBuilder = GoodsGroupsCompanion
    Function({
  Value<int?> id,
  required String title,
  required GroupType type,
});
typedef $$GoodsGroupsTableUpdateCompanionBuilder = GoodsGroupsCompanion
    Function({
  Value<int?> id,
  Value<String> title,
  Value<GroupType> type,
});

class $$GoodsGroupsTableTableManager extends RootTableManager<
    _$MainDatabase,
    $GoodsGroupsTable,
    GoodsGroup,
    $$GoodsGroupsTableFilterComposer,
    $$GoodsGroupsTableOrderingComposer,
    $$GoodsGroupsTableProcessedTableManager,
    $$GoodsGroupsTableInsertCompanionBuilder,
    $$GoodsGroupsTableUpdateCompanionBuilder> {
  $$GoodsGroupsTableTableManager(_$MainDatabase db, $GoodsGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GoodsGroupsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GoodsGroupsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$GoodsGroupsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<GroupType> type = const Value.absent(),
          }) =>
              GoodsGroupsCompanion(
            id: id,
            title: title,
            type: type,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            required String title,
            required GroupType type,
          }) =>
              GoodsGroupsCompanion.insert(
            id: id,
            title: title,
            type: type,
          ),
        ));
}

class $$GoodsGroupsTableProcessedTableManager extends ProcessedTableManager<
    _$MainDatabase,
    $GoodsGroupsTable,
    GoodsGroup,
    $$GoodsGroupsTableFilterComposer,
    $$GoodsGroupsTableOrderingComposer,
    $$GoodsGroupsTableProcessedTableManager,
    $$GoodsGroupsTableInsertCompanionBuilder,
    $$GoodsGroupsTableUpdateCompanionBuilder> {
  $$GoodsGroupsTableProcessedTableManager(super.$state);
}

class $$GoodsGroupsTableFilterComposer
    extends FilterComposer<_$MainDatabase, $GoodsGroupsTable> {
  $$GoodsGroupsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<GroupType, GroupType, String> get type =>
      $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ComposableFilter goodsItemsRefs(
      ComposableFilter Function($$GoodsItemsTableFilterComposer f) f) {
    final $$GoodsItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.goodsItems,
        getReferencedColumn: (t) => t.group,
        builder: (joinBuilder, parentComposers) =>
            $$GoodsItemsTableFilterComposer(ComposerState($state.db,
                $state.db.goodsItems, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$GoodsGroupsTableOrderingComposer
    extends OrderingComposer<_$MainDatabase, $GoodsGroupsTable> {
  $$GoodsGroupsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$GoodsItemsTableInsertCompanionBuilder = GoodsItemsCompanion Function({
  Value<int?> id,
  required String title,
  required double price,
  required int group,
});
typedef $$GoodsItemsTableUpdateCompanionBuilder = GoodsItemsCompanion Function({
  Value<int?> id,
  Value<String> title,
  Value<double> price,
  Value<int> group,
});

class $$GoodsItemsTableTableManager extends RootTableManager<
    _$MainDatabase,
    $GoodsItemsTable,
    GoodsItem,
    $$GoodsItemsTableFilterComposer,
    $$GoodsItemsTableOrderingComposer,
    $$GoodsItemsTableProcessedTableManager,
    $$GoodsItemsTableInsertCompanionBuilder,
    $$GoodsItemsTableUpdateCompanionBuilder> {
  $$GoodsItemsTableTableManager(_$MainDatabase db, $GoodsItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GoodsItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GoodsItemsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$GoodsItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<int> group = const Value.absent(),
          }) =>
              GoodsItemsCompanion(
            id: id,
            title: title,
            price: price,
            group: group,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            required String title,
            required double price,
            required int group,
          }) =>
              GoodsItemsCompanion.insert(
            id: id,
            title: title,
            price: price,
            group: group,
          ),
        ));
}

class $$GoodsItemsTableProcessedTableManager extends ProcessedTableManager<
    _$MainDatabase,
    $GoodsItemsTable,
    GoodsItem,
    $$GoodsItemsTableFilterComposer,
    $$GoodsItemsTableOrderingComposer,
    $$GoodsItemsTableProcessedTableManager,
    $$GoodsItemsTableInsertCompanionBuilder,
    $$GoodsItemsTableUpdateCompanionBuilder> {
  $$GoodsItemsTableProcessedTableManager(super.$state);
}

class $$GoodsItemsTableFilterComposer
    extends FilterComposer<_$MainDatabase, $GoodsItemsTable> {
  $$GoodsItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$GoodsGroupsTableFilterComposer get group {
    final $$GoodsGroupsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.group,
        referencedTable: $state.db.goodsGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GoodsGroupsTableFilterComposer(ComposerState($state.db,
                $state.db.goodsGroups, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter orderItemsRefs(
      ComposableFilter Function($$OrderItemsTableFilterComposer f) f) {
    final $$OrderItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.orderItems,
        getReferencedColumn: (t) => t.goodItem,
        builder: (joinBuilder, parentComposers) =>
            $$OrderItemsTableFilterComposer(ComposerState($state.db,
                $state.db.orderItems, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$GoodsItemsTableOrderingComposer
    extends OrderingComposer<_$MainDatabase, $GoodsItemsTable> {
  $$GoodsItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$GoodsGroupsTableOrderingComposer get group {
    final $$GoodsGroupsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.group,
        referencedTable: $state.db.goodsGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GoodsGroupsTableOrderingComposer(ComposerState($state.db,
                $state.db.goodsGroups, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$OrdersTableInsertCompanionBuilder = OrdersCompanion Function({
  Value<int?> id,
  required int waiter,
  required int table,
  required bool closed,
});
typedef $$OrdersTableUpdateCompanionBuilder = OrdersCompanion Function({
  Value<int?> id,
  Value<int> waiter,
  Value<int> table,
  Value<bool> closed,
});

class $$OrdersTableTableManager extends RootTableManager<
    _$MainDatabase,
    $OrdersTable,
    Order,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableProcessedTableManager,
    $$OrdersTableInsertCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder> {
  $$OrdersTableTableManager(_$MainDatabase db, $OrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$OrdersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$OrdersTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$OrdersTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            Value<int> waiter = const Value.absent(),
            Value<int> table = const Value.absent(),
            Value<bool> closed = const Value.absent(),
          }) =>
              OrdersCompanion(
            id: id,
            waiter: waiter,
            table: table,
            closed: closed,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            required int waiter,
            required int table,
            required bool closed,
          }) =>
              OrdersCompanion.insert(
            id: id,
            waiter: waiter,
            table: table,
            closed: closed,
          ),
        ));
}

class $$OrdersTableProcessedTableManager extends ProcessedTableManager<
    _$MainDatabase,
    $OrdersTable,
    Order,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableProcessedTableManager,
    $$OrdersTableInsertCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder> {
  $$OrdersTableProcessedTableManager(super.$state);
}

class $$OrdersTableFilterComposer
    extends FilterComposer<_$MainDatabase, $OrdersTable> {
  $$OrdersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get closed => $state.composableBuilder(
      column: $state.table.closed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$WaitersTableFilterComposer get waiter {
    final $$WaitersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.waiter,
        referencedTable: $state.db.waiters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WaitersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.waiters, joinBuilder, parentComposers)));
    return composer;
  }

  $$PlacesTableFilterComposer get table {
    final $$PlacesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.table,
        referencedTable: $state.db.places,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$PlacesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.places, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter orderItemsRefs(
      ComposableFilter Function($$OrderItemsTableFilterComposer f) f) {
    final $$OrderItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.orderItems,
        getReferencedColumn: (t) => t.order,
        builder: (joinBuilder, parentComposers) =>
            $$OrderItemsTableFilterComposer(ComposerState($state.db,
                $state.db.orderItems, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$OrdersTableOrderingComposer
    extends OrderingComposer<_$MainDatabase, $OrdersTable> {
  $$OrdersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get closed => $state.composableBuilder(
      column: $state.table.closed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$WaitersTableOrderingComposer get waiter {
    final $$WaitersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.waiter,
        referencedTable: $state.db.waiters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WaitersTableOrderingComposer(ComposerState(
                $state.db, $state.db.waiters, joinBuilder, parentComposers)));
    return composer;
  }

  $$PlacesTableOrderingComposer get table {
    final $$PlacesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.table,
        referencedTable: $state.db.places,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PlacesTableOrderingComposer(ComposerState(
                $state.db, $state.db.places, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$OrderItemsTableInsertCompanionBuilder = OrderItemsCompanion Function({
  Value<int?> id,
  required int order,
  required int goodItem,
  required int count,
  required double price,
});
typedef $$OrderItemsTableUpdateCompanionBuilder = OrderItemsCompanion Function({
  Value<int?> id,
  Value<int> order,
  Value<int> goodItem,
  Value<int> count,
  Value<double> price,
});

class $$OrderItemsTableTableManager extends RootTableManager<
    _$MainDatabase,
    $OrderItemsTable,
    OrderItem,
    $$OrderItemsTableFilterComposer,
    $$OrderItemsTableOrderingComposer,
    $$OrderItemsTableProcessedTableManager,
    $$OrderItemsTableInsertCompanionBuilder,
    $$OrderItemsTableUpdateCompanionBuilder> {
  $$OrderItemsTableTableManager(_$MainDatabase db, $OrderItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$OrderItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$OrderItemsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$OrderItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<int> goodItem = const Value.absent(),
            Value<int> count = const Value.absent(),
            Value<double> price = const Value.absent(),
          }) =>
              OrderItemsCompanion(
            id: id,
            order: order,
            goodItem: goodItem,
            count: count,
            price: price,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> id = const Value.absent(),
            required int order,
            required int goodItem,
            required int count,
            required double price,
          }) =>
              OrderItemsCompanion.insert(
            id: id,
            order: order,
            goodItem: goodItem,
            count: count,
            price: price,
          ),
        ));
}

class $$OrderItemsTableProcessedTableManager extends ProcessedTableManager<
    _$MainDatabase,
    $OrderItemsTable,
    OrderItem,
    $$OrderItemsTableFilterComposer,
    $$OrderItemsTableOrderingComposer,
    $$OrderItemsTableProcessedTableManager,
    $$OrderItemsTableInsertCompanionBuilder,
    $$OrderItemsTableUpdateCompanionBuilder> {
  $$OrderItemsTableProcessedTableManager(super.$state);
}

class $$OrderItemsTableFilterComposer
    extends FilterComposer<_$MainDatabase, $OrderItemsTable> {
  $$OrderItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get count => $state.composableBuilder(
      column: $state.table.count,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$OrdersTableFilterComposer get order {
    final $$OrdersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.order,
        referencedTable: $state.db.orders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$OrdersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.orders, joinBuilder, parentComposers)));
    return composer;
  }

  $$GoodsItemsTableFilterComposer get goodItem {
    final $$GoodsItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goodItem,
        referencedTable: $state.db.goodsItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GoodsItemsTableFilterComposer(ComposerState($state.db,
                $state.db.goodsItems, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$OrderItemsTableOrderingComposer
    extends OrderingComposer<_$MainDatabase, $OrderItemsTable> {
  $$OrderItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get count => $state.composableBuilder(
      column: $state.table.count,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$OrdersTableOrderingComposer get order {
    final $$OrdersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.order,
        referencedTable: $state.db.orders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$OrdersTableOrderingComposer(ComposerState(
                $state.db, $state.db.orders, joinBuilder, parentComposers)));
    return composer;
  }

  $$GoodsItemsTableOrderingComposer get goodItem {
    final $$GoodsItemsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goodItem,
        referencedTable: $state.db.goodsItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GoodsItemsTableOrderingComposer(ComposerState($state.db,
                $state.db.goodsItems, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$MainDatabaseManager {
  final _$MainDatabase _db;
  _$MainDatabaseManager(this._db);
  $$WaitersTableTableManager get waiters =>
      $$WaitersTableTableManager(_db, _db.waiters);
  $$PlacesTableTableManager get places =>
      $$PlacesTableTableManager(_db, _db.places);
  $$GoodsGroupsTableTableManager get goodsGroups =>
      $$GoodsGroupsTableTableManager(_db, _db.goodsGroups);
  $$GoodsItemsTableTableManager get goodsItems =>
      $$GoodsItemsTableTableManager(_db, _db.goodsItems);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db, _db.orders);
  $$OrderItemsTableTableManager get orderItems =>
      $$OrderItemsTableTableManager(_db, _db.orderItems);
}
