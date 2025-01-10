import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/location/location.dart';
import 'package:delishop/core/data/repo/location_repo.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:equatable/equatable.dart';

import '../../core/data/api_consts.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  final LocationRepo locationRepo;

  GlobalCubit(this.locationRepo)
      : super(const GlobalState(UIState(), UIState(), UIState(), UIState())) {
    Future.wait([
      // fetchDefaultLocation(),
      fetchAllLocations(),
    ]);
  }

  Future<void> fetchDefaultLocation() async {
    emit(state.copyWith(defaultLocation: const UIState(isLoading: true)));
    final response = await locationRepo.getDefaultLocation();
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(defaultLocation: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(defaultLocation: UIState(error: domainErrorModel)));
      },
    );
  }

  Future<void> fetchAllLocations() async {
    emit(state.copyWith(allLocations: const UIState(isLoading: true)));
    final response = await locationRepo.getUserLocations();
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(allLocations: UIState(data: successData.data)));
      },
      onError: (domainErrorModel) {
        if (domainErrorModel.code == StatusCodes.notFound) {
          emit(state.copyWith(allLocations: const UIState(data: [])));
        }
        emit(state.copyWith(allLocations: UIState(error: domainErrorModel)));
      },
    );
  }
  Future<void> deleteLocation(int locationId) async {
    emit(state.copyWith(deleteState: const UIState(isLoading: true)));
    final response = await locationRepo.deleteLocation(locationId);
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(deleteState: UIState(data: successData)));
        reload();
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(deleteState: UIState(error: domainErrorModel)));
      },
    );
  }
  Future<void> addNewLocation(Location location) async {
    print("Let's add: " + location.toString());
    emit(state.copyWith(addState: const UIState(isLoading: true)));
    final response = await locationRepo.addNewLocation(location);
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(addState: UIState(data: successData)));
        reload();
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(addState: UIState(error: domainErrorModel)));
      },
    );
  }

  void loadEmptyState() {
    Future.wait([fetchDefaultLocation()]);
  }

  void reload() {
    Future.wait([
      fetchAllLocations()
    ]);
  }

  void changeSelectedBottomNavBarIndexIndex(int newValue) {
    emit(state.copyWith(selectedBottomNavBarIndex: newValue));
  }
}
