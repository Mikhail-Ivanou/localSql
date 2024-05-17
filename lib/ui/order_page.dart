import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_sql/domain/models/full_goods_item.dart';
import 'package:local_sql/domain/models/full_order_item.dart';
import 'package:local_sql/injector.dart';
import 'package:local_sql/state/order/order_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
    required this.orderId,
    required this.place,
  });

  final int orderId;
  final String place;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderBloc>(
      create: (context) =>
          injector.get()..add(OrderInitEvent(orderId: orderId)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Order #$orderId, $place'),
          actions: const [_CloseAction()],
        ),
        body: const _MainContent(),
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _TotalOrder(),
        Expanded(child: _CurrentOrders()),
        Expanded(child: _Goods()),
      ],
    );
  }
}

class _TotalOrder extends StatelessWidget {
  const _TotalOrder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
      switch (state) {
        case OrderLoaded():
          final items = state.orderItems;
          final sum = items.fold(
            0.0,
            (previousValue, element) =>
                previousValue + (element.item.price * element.item.count),
          );
          return Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Total: $sum',
              ),
            ),
          );
        default:
          return const SizedBox.shrink();
      }
    });
  }
}

class _CurrentOrders extends StatelessWidget {
  const _CurrentOrders();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
      switch (state) {
        case OrderLoaded():
          final items = state.orderItems;
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = items[index];
              return _OrderItemCell(item);
            },
            itemCount: items.length,
          );
        default:
          return const SizedBox.shrink();
      }
    });
  }
}

class _OrderItemCell extends StatelessWidget {
  final FullOrderItem item;

  const _OrderItemCell(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.goodsItem.title,
                  style: const TextStyle(fontSize: 16),
                ),
                Text('${item.group.title}/${item.group.type.name}'),
                Text(item.item.price.toString()),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<OrderBloc>()
                          .add(DecreaseOrderItemsCountEvent(item.item));
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 40),
                    child: Center(child: Text(item.item.count.toString())),
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<OrderBloc>()
                          .add(IncreaseOrderItemsCountEvent(item.item));
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              Text('Sum: ${item.item.price * item.item.count}')
            ],
          ),
        ],
      ),
    );
  }
}

class _Goods extends StatelessWidget {
  const _Goods();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
      switch (state) {
        case OrderLoaded():
          if (state.order.closed) {
            return const SizedBox.shrink();
          }
          final items = state.goodsItems;
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = items[index];
              return _GoodItemCell(item);
            },
            itemCount: items.length,
          );
        default:
          return const SizedBox.shrink();
      }
    });
  }
}

class _GoodItemCell extends StatelessWidget {
  final FullGoodsItem item;

  const _GoodItemCell(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          context.read<OrderBloc>().add(AddGoodsItemsEvent(item.item));
        },
        child: Column(
          children: [
            Text(
              item.item.title,
              style: const TextStyle(fontSize: 16),
            ),
            Text('${item.group.title}/${item.group.type.name}'),
            Text('Price: ${item.item.price}'),
          ],
        ),
      ),
    );
  }
}

class _CloseAction extends StatelessWidget {
  const _CloseAction();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
      switch (state) {
        case OrderLoaded():
          if (state.order.closed) {
            return const SizedBox.shrink();
          }
          return GestureDetector(
            onTap: () {
              context.read<OrderBloc>().add(const OrderCloseEvent());
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Close'),
            ),
          );
        default:
          return const SizedBox.shrink();
      }
    });
  }
}
