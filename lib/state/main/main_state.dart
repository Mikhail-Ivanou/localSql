part of 'main_bloc.dart';

sealed class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoaded extends MainState {
  final List<Place> availablePlaces;
  final List<Waiter> waiters;
  final Waiter? selectedWaiter;
  final List<FullOrder> openOrders;

  const MainLoaded({
    required this.availablePlaces,
    required this.waiters,
    this.selectedWaiter,
    this.openOrders = const [],
  });

  @override
  List<Object?> get props => [
        availablePlaces,
        waiters,
        selectedWaiter,
        openOrders,
      ];

  MainLoaded copyWith({
    List<Place>? availablePlaces,
    List<Waiter>? waiters,
    Waiter? selectedWaiter,
    List<FullOrder>? openOrders,
  }) {
    return MainLoaded(
      availablePlaces: availablePlaces ?? this.availablePlaces,
      waiters: waiters ?? this.waiters,
      selectedWaiter: selectedWaiter ?? this.selectedWaiter,
      openOrders: openOrders ?? this.openOrders,
    );
  }
}
