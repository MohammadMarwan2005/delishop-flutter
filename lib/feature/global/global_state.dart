part of 'global_cubit.dart';

class GlobalState extends Equatable {
  final UIState<Location> defaultLocation;
  final UIState<List<Location>> allLocations;
  final UIState<Location> deleteState;
  final UIState<Location> addState;
  final int selectedBottomNavBarIndex;

  const GlobalState(
      this.defaultLocation, this.allLocations, this.deleteState, this.addState,
      {this.selectedBottomNavBarIndex = 0});

  @override
  List<Object?> get props =>
      [defaultLocation, allLocations, deleteState, addState, selectedBottomNavBarIndex];

  GlobalState copyWith({
    UIState<Location>? defaultLocation,
    UIState<List<Location>>? allLocations,
    UIState<Location>? deleteState,
    UIState<Location>? addState,
    int? selectedBottomNavBarIndex,
  }) {
    return GlobalState(
        defaultLocation ?? this.defaultLocation,
        allLocations ?? this.allLocations,
        deleteState ?? this.deleteState,
        addState ?? this.addState,
        selectedBottomNavBarIndex:
            selectedBottomNavBarIndex ?? this.selectedBottomNavBarIndex);
  }
}
