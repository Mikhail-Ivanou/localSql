part of 'reports_bloc.dart';

class ReportsState extends Equatable {
  const ReportsState({
    required this.waiters,
    required this.places,
    required this.waiter,
    required this.place,
    required this.groupType,
    required this.orders,
  });

  factory ReportsState.empty() {
    return const ReportsState(
      places: [],
      waiters: [],
      waiter: ValueWrapper(null),
      place: ValueWrapper(null),
      groupType: ValueWrapper(null),
      orders: [],
    );
  }

  final List<Waiter> waiters;
  final List<Place> places;
  final ValueWrapper<Waiter> waiter;
  final ValueWrapper<Place> place;
  final ValueWrapper<GroupType> groupType;
  final List<OrderWithDetails> orders;

  @override
  List<Object> get props => [
        waiters,
        places,
        waiter,
        place,
        groupType,
        orders,
      ];

  ReportsState copyWith({
    List<Waiter>? waiters,
    List<Place>? places,
    ValueWrapper<Waiter>? waiter,
    ValueWrapper<Place>? place,
    ValueWrapper<GroupType>? groupType,
    List<OrderWithDetails>? orders,
  }) {
    return ReportsState(
      waiters: waiters ?? this.waiters,
      places: places ?? this.places,
      waiter: waiter ?? this.waiter,
      place: place ?? this.place,
      groupType: groupType ?? this.groupType,
      orders: orders ?? this.orders,
    );
  }
}

class ValueWrapper<T> extends Object {
  const ValueWrapper(this.value);

  final T? value;
}
