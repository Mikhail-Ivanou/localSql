import 'package:drift/drift.dart';
import 'package:local_sql/data/db/goods_items_table.dart';
import 'package:local_sql/data/db/orders_table.dart';

class OrderItems extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  IntColumn get order => integer().references(Orders, #id)();

  IntColumn get goodItem => integer().references(GoodsItems, #id)();

  IntColumn get count => integer()();

  //price can be changed later, save exact value once ordered
  RealColumn get price => real()();
}
