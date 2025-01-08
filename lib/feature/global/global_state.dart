part of 'global_cubit.dart';

class GlobalState extends Equatable {
  final UIState<Location> defaultLocation;
  final UIState<List<Location>> allLocations;
  final UIState<Location> deleteState;
  final UIState<Location> addState;

  const GlobalState(this.defaultLocation, this.allLocations, this.deleteState, this.addState);

  @override
  List<Object?> get props => [defaultLocation, allLocations, deleteState, addState];
  GlobalState copyWith({
    UIState<Location>? defaultLocation,
    UIState<List<Location>>? allLocations,
    UIState<Location>? deleteState,
    UIState<Location>? addState,
  }) {
    return GlobalState(
      defaultLocation ?? this.defaultLocation,
      allLocations ?? this.allLocations,
      deleteState ?? this.deleteState,
      addState ?? this.addState,
    );
  }
}

