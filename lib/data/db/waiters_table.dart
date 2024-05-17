import 'package:drift/drift.dart';

class Waiters extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get name => text().withLength(min: 3, max: 32)();
}
