import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_sql/data/db/db.dart';
import 'package:local_sql/data/db/goods_groups_table.dart';
import 'package:local_sql/injector.dart';
import 'package:local_sql/state/reports/reports_bloc.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReportsBloc>(
      create: (context) => injector.get()..add(const ReportsInitEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Reports'),
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
        _WaiterSelector(),
        _PlacesSelector(),
        // _TypesSelector(),
        _Total(),
        Expanded(child: _OrdersInfo()),
      ],
    );
  }
}

class _WaiterSelector extends StatelessWidget {
  const _WaiterSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsBloc, ReportsState>(
      builder: (baseContext, state) {
        final waiter = state.waiter.value;
        return _BaseSelector<Waiter>(
          label: 'waiter',
          name: (value) => value?.name ?? '',
          value: waiter,
          values: state.waiters,
          onSelected: (value) {
            baseContext
                .read<ReportsBloc>()
                .add(SelectWaiterEvent(waiter: value));
          },
        );
      },
    );
  }
}

class _PlacesSelector extends StatelessWidget {
  const _PlacesSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsBloc, ReportsState>(
      builder: (baseContext, state) {
        final place = state.place.value;
        return _BaseSelector<Place>(
          label: 'place',
          name: (value) => value?.name ?? '',
          value: place,
          values: state.places,
          onSelected: (value) {
            baseContext.read<ReportsBloc>().add(SelectPlaceEvent(place: value));
          },
        );
      },
    );
  }
}

class _TypesSelector extends StatelessWidget {
  const _TypesSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsBloc, ReportsState>(
      builder: (baseContext, state) {
        final type = state.groupType.value;

        return _BaseSelector<GroupType>(
          label: 'type',
          name: (value) => value?.name ?? '',
          value: type,
          values: GroupType.values,
          onSelected: (value) {
            baseContext.read<ReportsBloc>().add(SelectTypeEvent(type: value));
          },
        );
      },
    );
  }
}

class _BaseSelector<T> extends StatelessWidget {
  const _BaseSelector({
    required this.value,
    required this.values,
    required this.label,
    required this.onSelected,
    required this.name,
  });

  final T? value;
  final List<T> values;
  final String label;
  final Function(T? value) onSelected;
  final String Function(T? value) name;

  @override
  Widget build(BuildContext baseContext) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: baseContext,
          builder: (context) => AlertDialog(
            title: Text('Select a $label'),
            scrollable: true,
            content: Column(
              children: values
                  .map((current) => GestureDetector(
                        onTap: () {
                          onSelected(current);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            name(current),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  onSelected(null);
                  Navigator.pop(context);
                },
                child: const Text('Clear'),
              )
            ],
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(16).copyWith(bottom: 0),
        padding: const EdgeInsets.all(16),
        color: Colors.black12,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: value != null
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            if (value != null) ...[
              Text('Selected $label'),
              Text(
                name(value),
                style: const TextStyle(fontSize: 16),
              ),
            ],
            if (value == null)
              Text(
                'Select a $label',
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}

class _Total extends StatelessWidget {
  const _Total();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsBloc, ReportsState>(builder: (context, state) {
      final items = state.orders;
      final sum = items.length;
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: sum > 0
              ? Text(
                  'Orders count: $sum',
                )
              : const SizedBox.shrink(),
        ),
      );
    });
  }
}

class _OrdersInfo extends StatelessWidget {
  const _OrdersInfo();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsBloc, ReportsState>(builder: (context, state) {
      final items = state.orders;
      return ListView.builder(
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.lightGreenAccent,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('#${item.order.id}'),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Waiter: ${item.waiter.name}'),
                        Text(item.place.name),
                      ],
                    ),
                  ),
                  Text(item.order.closed ? 'Closed' : 'Open'),
                ],
              ),
            ),
          );
        },
        itemCount: items.length,
      );
    });
  }
}
