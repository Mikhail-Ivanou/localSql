import 'package:local_sql/data/db/db.dart';

class FullOrderItem {
  final OrderItem item;
  final GoodsItem goodsItem;
  final GoodsGroup group;

  FullOrderItem({
    required this.item,
    required this.goodsItem,
    required this.group,
  });
}
