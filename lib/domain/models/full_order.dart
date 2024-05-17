import 'package:local_sql/data/db/db.dart';

class FullOrder {
  final Order order;
  final Place place;

  FullOrder({
    required this.order,
    required this.place,
  });
}
