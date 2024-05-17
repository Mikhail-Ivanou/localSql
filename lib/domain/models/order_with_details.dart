import 'package:local_sql/data/db/db.dart';

class OrderWithDetails {
  final Order order;
  final Place place;
  final Waiter waiter;

  OrderWithDetails({
    required this.order,
    required this.place,
    required this.waiter,
  });
}
