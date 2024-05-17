part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();
}

class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}

class OrderLoaded extends OrderState {
  final List<FullGoodsItem> goodsItems;
  final List<GoodsGroup> groups;
  final List<FullOrderItem> orderItems;
  final Order order;

  const OrderLoaded({
    required this.goodsItems,
    required this.groups,
    required this.orderItems,
    required this.order,
  });

  @override
  List<Object> get props => [
        goodsItems,
        groups,
        orderItems,
        order,
      ];

  OrderLoaded copyWith({
    List<FullGoodsItem>? goodsItems,
    List<GoodsGroup>? groups,
    List<FullOrderItem>? orderItems,
    Order? order,
  }) {
    return OrderLoaded(
      goodsItems: goodsItems ?? this.goodsItems,
      groups: groups ?? this.groups,
      orderItems: orderItems ?? this.orderItems,
      order: order ?? this.order,
    );
  }
}
