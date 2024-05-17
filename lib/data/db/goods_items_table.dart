import 'package:drift/drift.dart';
import 'package:local_sql/data/db/goods_groups_table.dart';

class GoodsItems extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get title => text().withLength(min: 3, max: 32)();

  RealColumn get price => real()();

  IntColumn get group => integer().references(GoodsGroups, #id)();
}
