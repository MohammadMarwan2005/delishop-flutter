import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';

import '../api_service.dart';
import '../model/location/location.dart';
import '../model/location/location_list_response_model.dart';
import '../response_result.dart';

class LocationRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  LocationRepo(this._apiService, this._connectivity);

  Future<ResponseResult<Location>> getDefaultLocation() async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getDefaultLocation();
      },
    );
  }

  Future<ResponseResult<Location>> addNewLocation(Location location) async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.addNewLocation(location);
      },
    );
  }

  Future<ResponseResult<Location>> deleteLocation(int locationId) async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.deleteLocation(locationId);
      },
    );
  }

  Future<ResponseResult<LocationListResponseModel>> getUserLocations() async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getUserLocations();
      },
    );
  }
}
