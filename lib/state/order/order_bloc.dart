import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_sql/data/db/db.dart';
import 'package:local_sql/domain/models/full_goods_item.dart';
import 'package:local_sql/domain/models/full_order_item.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final MainDatabase db;
  StreamSubscription<List<FullOrderItem>>? orderItemsListener;
  StreamSubscription<Order?>? orderListener;

  OrderBloc(this.db) : super(OrderInitial()) {
    on<OrderInitEvent>((event, emit) async {
      final groups = await db.goodsGroups.all().get();

      final goodsItemsQuery = db.goodsItems.select().join([
        leftOuterJoin(
            db.goodsGroups, db.goodsGroups.id.equalsExp(db.goodsItems.group))
      ]);
      final items = (await goodsItemsQuery.get()).map((row) {
        return FullGoodsItem(
          item: row.readTable(db.goodsItems),
          group: row.readTable(db.goodsGroups),
        );
      }).toList();

      final orderItemsQuery = (db.orderItems.select()
            ..where(
              (tbl) => tbl.order.equals(event.orderId),
            ))
          .join([
        leftOuterJoin(
            db.goodsItems, db.goodsItems.id.equalsExp(db.orderItems.goodItem)),
        leftOuterJoin(
            db.goodsGroups, db.goodsGroups.id.equalsExp(db.goodsItems.group)),
      ]);
      final orderItems = (await orderItemsQuery.get()).map((row) {
        return FullOrderItem(
          item: row.readTable(db.orderItems),
          goodsItem: row.readTable(db.goodsItems),
          group: row.readTable(db.goodsGroups),
        );
      }).toList();

      final orderQuery = (db.orders.select()
        ..where(
          (tbl) => tbl.id.equals(event.orderId),
        ));
      final order = await orderQuery.getSingleOrNull();

      if (order == null) {
        //magic shouldn't happen
        return;
      }
      emit(OrderLoaded(
        goodsItems: items,
        groups: groups,
        orderItems: orderItems,
        order: order,
      ));

      _listenOrderItems(orderItemsQuery);
      _listenOrder(orderQuery);
    });

    on<OrderCloseEvent>((event, emit) {
      final currentState = state;
      switch (currentState) {
        case OrderLoaded():
          (db.orders.update()
                ..where(
                  (tbl) => tbl.id.equals(currentState.order.id ?? -1),
                ))
              .write(const OrdersCompanion(closed: Value(true)));
        default:
      }
    });

    on<OrderUpdatedEvent>((event, emit) {
      final currentState = state;
      switch (currentState) {
        case OrderLoaded():
          emit(currentState.copyWith(order: event.order));
        default:
      }
    });

    on<OrderItemsUpdatedEvent>((event, emit) {
      final currentState = state;
      switch (currentState) {
        case OrderLoaded():
          emit(currentState.copyWith(orderItems: event.orderItems));
        default:
      }
    });

    on<AddGoodsItemsEvent>((event, emit) {
      final currentState = state;
      switch (currentState) {
        case OrderLoaded():
          final orderId = currentState.order.id;
          final itemId = event.item.id;
          if (orderId == null || itemId == null) {
            return;
          }
          final orderItem = currentState.orderItems.firstWhereOrNull(
            (element) => element.item.goodItem == itemId,
          );
          if (orderItem != null) {
            add(IncreaseOrderItemsCountEvent(orderItem.item));
            return;
          }
          db.orderItems.insertOne(OrderItem(
            order: orderId,
            count: 1,
            goodItem: itemId,
            price: event.item.price,
          ));
        default:
      }
    });

    on<IncreaseOrderItemsCountEvent>((event, emit) {
      final currentState = state;
      switch (currentState) {
        case OrderLoaded():
          final count = event.item.count;
          (db.orderItems.update()
                ..where(
                  (tbl) => tbl.id.equals(event.item.id ?? -1),
                ))
              .write(OrderItemsCompanion(count: Value(count + 1)));
        default:
      }
    });

    on<DecreaseOrderItemsCountEvent>((event, emit) {
      final currentState = state;
      switch (currentState) {
        case OrderLoaded():
          final count = event.item.count;
          if (count == 0) {
            (db.orderItems.delete()
                  ..where(
                    (tbl) => tbl.id.equals(event.item.id ?? -1),
                  ))
                .go();
            return;
          }
          (db.orderItems.update()
                ..where(
                  (tbl) => tbl.id.equals(event.item.id ?? -1),
                ))
              .write(OrderItemsCompanion(count: Value(count - 1)));
        default:
      }
    });
  }

  void _listenOrder(SimpleSelectStatement<$OrdersTable, Order> orderQuery) {
    orderListener?.cancel();
    orderListener = orderQuery.watchSingleOrNull().listen(
      (event) {
        if (event != null) {
          add(OrderUpdatedEvent(event));
        }
      },
    );
  }

  void _listenOrderItems(
      JoinedSelectStatement<HasResultSet, dynamic> orderItemsQuery) {
    orderItemsListener?.cancel();
    orderItemsListener = orderItemsQuery.watch().map(
      (rows) {
        return rows.map((row) {
          return FullOrderItem(
            item: row.readTable(db.orderItems),
            goodsItem: row.readTable(db.goodsItems),
            group: row.readTable(db.goodsGroups),
          );
        }).toList();
      },
    ).listen(
      (orders) {
        add(OrderItemsUpdatedEvent(orders));
      },
    );
  }

  @override
  Future<void> close() {
    orderListener?.cancel();
    return super.close();
  }
}
