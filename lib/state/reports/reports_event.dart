part of 'reports_bloc.dart';

sealed class ReportsEvent extends Equatable {
  const ReportsEvent();
}

class ReportsInitEvent extends ReportsEvent {
  const ReportsInitEvent();

  @override
  List<Object?> get props => [];
}

class SelectWaiterEvent extends ReportsEvent {
  final Waiter? waiter;

  const SelectWaiterEvent({
    required this.waiter,
  });

  @override
  List<Object?> get props => [waiter];
}

class SelectPlaceEvent extends ReportsEvent {
  final Place? place;

  const SelectPlaceEvent({
    required this.place,
  });

  @override
  List<Object?> get props => [place];
}

class SelectTypeEvent extends ReportsEvent {
  final GroupType? type;

  const SelectTypeEvent({
    required this.type,
  });

  @override
  List<Object?> get props => [type];
}

class ApplyFilterEvent extends ReportsEvent {
  const ApplyFilterEvent();

  @override
  List<Object?> get props => [];
}
