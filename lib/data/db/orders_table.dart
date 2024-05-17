import 'package:drift/drift.dart';
import 'package:local_sql/data/db/places_table.dart';
import 'package:local_sql/data/db/waiters_table.dart';

class Orders extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  IntColumn get waiter => integer().references(Waiters, #id)();

  IntColumn get table => integer().references(Places, #id)();

  BoolColumn get closed => boolean()();
}
