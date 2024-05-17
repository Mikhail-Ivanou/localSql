import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_sql/data/db/db.dart';
import 'package:local_sql/data/db/goods_groups_table.dart';
import 'package:local_sql/domain/models/order_with_details.dart';

part 'reports_event.dart';

part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final MainDatabase db;

  ReportsBloc(this.db) : super(ReportsState.empty()) {
    on<ReportsInitEvent>((event, emit) async {
      final waiters = await db.waiters.all().get();
      final places = await db.places.all().get();

      emit(state.copyWith(
        places: places,
        waiters: waiters,
      ));
    });

    on<SelectWaiterEvent>((event, emit) {
      emit(state.copyWith(
        waiter: ValueWrapper(event.waiter),
      ));
      add(const ApplyFilterEvent());
    });

    on<SelectPlaceEvent>((event, emit) {
      emit(state.copyWith(
        place: ValueWrapper(event.place),
      ));
      add(const ApplyFilterEvent());
    });

    on<SelectTypeEvent>((event, emit) {
      emit(state.copyWith(
        groupType: ValueWrapper(event.type),
      ));
      add(const ApplyFilterEvent());
    });

    on<ApplyFilterEvent>((event, emit) async {
      final orderItemsQuery = db.orders.select();
      final waiter = state.waiter.value;
      if (waiter != null) {
        orderItemsQuery.where(
          (tbl) => tbl.waiter.equals(waiter.id ?? -1),
        );
      }
      final place = state.place.value;
      if (place != null) {
        orderItemsQuery.where(
          (tbl) => tbl.table.equals(place.id ?? -1),
        );
      }
      final joined = orderItemsQuery.join([
        leftOuterJoin(db.waiters, db.waiters.id.equalsExp(db.orders.waiter)),
        leftOuterJoin(db.places, db.places.id.equalsExp(db.orders.table)),
      ]);
      final orderItems = (await joined.get()).map((row) {
        return OrderWithDetails(
          order: row.readTable(db.orders),
          waiter: row.readTable(db.waiters),
          place: row.readTable(db.places),
        );
      }).toList();
      emit(state.copyWith(
        orders: orderItems,
      ));
    });

    add(const ApplyFilterEvent());
  }
}
