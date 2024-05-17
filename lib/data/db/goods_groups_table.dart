import 'package:drift/drift.dart';

class GoodsGroups extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get title => text().withLength(min: 3, max: 32)();

  TextColumn get type => textEnum<GroupType>()();
}

enum GroupType {
  drinks,
  starter,
  main,
}
