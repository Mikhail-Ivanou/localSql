part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();
}

class OrderInitEvent extends OrderEvent {
  final int orderId;

  const OrderInitEvent({
    required this.orderId,
  });

  @override
  List<Object?> get props => [orderId];
}

class OrderCloseEvent extends OrderEvent {
  const OrderCloseEvent();

  @override
  List<Object?> get props => [];
}

class OrderUpdatedEvent extends OrderEvent {
  const OrderUpdatedEvent(this.order);

  final Order order;

  @override
  List<Object?> get props => [order];
}

class OrderItemsUpdatedEvent extends OrderEvent {
  const OrderItemsUpdatedEvent(this.orderItems);

  final List<FullOrderItem> orderItems;

  @override
  List<Object?> get props => [orderItems];
}

class AddGoodsItemsEvent extends OrderEvent {
  const AddGoodsItemsEvent(this.item);

  final GoodsItem item;

  @override
  List<Object?> get props => [item];
}

class IncreaseOrderItemsCountEvent extends OrderEvent {
  const IncreaseOrderItemsCountEvent(this.item);

  final OrderItem item;

  @override
  List<Object?> get props => [item];
}

class DecreaseOrderItemsCountEvent extends OrderEvent {
  const DecreaseOrderItemsCountEvent(this.item);

  final OrderItem item;

  @override
  List<Object?> get props => [item];
}
