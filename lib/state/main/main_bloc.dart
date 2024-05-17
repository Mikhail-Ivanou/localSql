import 'dart:async';

import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_sql/data/db/db.dart';
import 'package:local_sql/domain/models/full_order.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainDatabase db;
  StreamSubscription<List<Place>>? placesListener;
  StreamSubscription<List>? ordersListener;

  MainBloc(this.db) : super(MainInitial()) {
    on<MainInitEvent>((event, emit) async {
      final waiters = await db.waiters.all().get();

      emit(MainLoaded(
        availablePlaces: const [],
        waiters: waiters,
      ));
    });

    on<SelectWaiterEvent>((event, emit) async {
      final currentState = state;
      switch (currentState) {
        case MainLoaded():
          _listenPlaces();
          _listenOrders(event);
          emit(currentState.copyWith(selectedWaiter: event.waiter));
        default:
      }
    });

    on<AvailablePlacesUpdatedEvent>((event, emit) async {
      final currentState = state;
      switch (currentState) {
        case MainLoaded():
          emit(currentState.copyWith(availablePlaces: event.places));
        default:
      }
    });

    on<OpenOrdersUpdatedEvent>((event, emit) async {
      final currentState = state;
      switch (currentState) {
        case MainLoaded():
          emit(currentState.copyWith(openOrders: event.orders));
        default:
      }
    });

    on<CreateOrderEvent>((event, emit) async {
      final currentState = state;
      switch (currentState) {
        case MainLoaded():
          final waiter = currentState.selectedWaiter;
          if (waiter == null) {
            return;
          }
          db.orders.insertOne(Order(
            waiter: waiter.id ?? -1,
            closed: false,
            table: event.place.id ?? -1,
          ));
        default:
      }
    });
  }

  void _listenPlaces() {
    placesListener?.cancel();
    final subquery = db.orders.selectOnly()..addColumns([db.orders.table]);
    subquery.where(db.orders.closed.equals(false));

    final placesQuery = (db.places.select()
      ..where(
        (tbl) => tbl.id.isNotInQuery(subquery),
      ));
    placesListener = placesQuery.watch().listen(
      (places) {
        add(AvailablePlacesUpdatedEvent(places: places));
      },
    );
  }

  void _listenOrders(SelectWaiterEvent event) {
    ordersListener?.cancel();
    final ordersQuery = (db.orders.select()
          ..where(
            (tbl) => tbl.waiter.equals(event.waiter.id ?? -1),
          )
          ..where(
            (tbl) => tbl.closed.equals(false),
          ))
        .join([
      leftOuterJoin(db.places, db.places.id.equalsExp(db.orders.table))
    ]);
    ordersListener = ordersQuery.watch().map(
      (rows) {
        return rows.map((row) {
          return FullOrder(
            order: row.readTable(db.orders),
            place: row.readTable(db.places),
          );
        }).toList();
      },
    ).listen(
      (orders) {
        add(OpenOrdersUpdatedEvent(orders: orders));
      },
    );
  }

  @override
  Future<void> close() {
    placesListener?.cancel();
    ordersListener?.cancel();
    return super.close();
  }
}
