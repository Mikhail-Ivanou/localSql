import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_sql/injector.dart';
import 'package:local_sql/state/main/main_bloc.dart';
import 'package:local_sql/ui/order_page.dart';
import 'package:local_sql/ui/reports_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => injector.get()..add(const MainInitEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Local SQL demo app'),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportsPage()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Reports'),
              ),
            ),
          ],
        ),
        body: const _MainContent(),
        floatingActionButton:
            const _FloatingActionButton(), // This trailing comma makes auto-formatting nicer for build methods.
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
        _WaiterSelector(),
        Expanded(child: _OpenOrders()),
      ],
    );
  }
}

class _WaiterSelector extends StatelessWidget {
  const _WaiterSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (baseContext, state) {
        switch (state) {
          case MainInitial():
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text('Loading...'),
              ),
            );
          case MainLoaded():
            final waiter = state.selectedWaiter;
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: baseContext,
                  builder: (context) => AlertDialog(
                    title: const Text('Select a waiter'),
                    scrollable: true,
                    content: Column(
                      children: state.waiters
                          .map((currentWaiter) => GestureDetector(
                                onTap: () {
                                  baseContext.read<MainBloc>().add(
                                      SelectWaiterEvent(waiter: currentWaiter));
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    currentWaiter.name,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                color: Colors.black12,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: waiter != null
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    if (waiter != null) ...[
                      const Text('Selected waiter'),
                      Text(
                        waiter.name,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                    if (waiter == null)
                      const Text(
                        'Select a waiter',
                        style: TextStyle(fontSize: 16),
                      ),
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}

class _OpenOrders extends StatelessWidget {
  const _OpenOrders();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      switch (state) {
        case MainInitial():
          return const SizedBox.shrink();
        case MainLoaded():
          if (state.selectedWaiter == null) {
            return const SizedBox.shrink();
          }
          return state.openOrders.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final order = state.openOrders[index];
                    return GestureDetector(
                      onTap: () {
                        final id = order.order.id;
                        if (id == null) {
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderPage(
                              orderId: id,
                              place: order.place.name,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text('Order #${order.order.id}'),
                          Text(order.place.name),
                        ],
                      ),
                    );
                  },
                  itemCount: state.openOrders.length,
                )
              : const Text('Create new order');
      }
    });
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (baseContext, state) {
        switch (state) {
          case MainInitial():
            return const SizedBox.shrink();
          case MainLoaded():
            return state.availablePlaces.isNotEmpty
                ? FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: baseContext,
                        builder: (context) => AlertDialog(
                          title: const Text('Select a place'),
                          scrollable: true,
                          content: Column(
                            children: state.availablePlaces
                                .map((place) => GestureDetector(
                                      onTap: () {
                                        baseContext.read<MainBloc>().add(
                                            CreateOrderEvent(place: place));
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          place.name,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.add),
                  )
                : const SizedBox.shrink();
        }
      },
    );
  }
}
