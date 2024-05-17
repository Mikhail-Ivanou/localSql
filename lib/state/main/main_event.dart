part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();
}

class MainInitEvent extends MainEvent {
  const MainInitEvent();

  @override
  List<Object?> get props => [];
}

class SelectWaiterEvent extends MainEvent {
  const SelectWaiterEvent({required this.waiter});

  final Waiter waiter;

  @override
  List<Object?> get props => [waiter];
}

class AvailablePlacesUpdatedEvent extends MainEvent {
  const AvailablePlacesUpdatedEvent({required this.places});

  final List<Place> places;

  @override
  List<Object?> get props => [places];
}

class OpenOrdersUpdatedEvent extends MainEvent {
  const OpenOrdersUpdatedEvent({required this.orders});

  final List<FullOrder> orders;

  @override
  List<Object?> get props => [orders];
}

class CreateOrderEvent extends MainEvent {
  const CreateOrderEvent({required this.place});

  final Place place;

  @override
  List<Object?> get props => [place];
}
