import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';

import '../api_service.dart';
import '../model/profile/profile.dart';
import '../response_result.dart';

class ProfileRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  ProfileRepo(this._apiService, this._connectivity);

  Future<ResponseResult<Profile>> getProfile() async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getProfile();
      },
    );
  }

  Future<ResponseResult<Profile>> updateProfile(
      Profile profile, File? image) async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.updateProfile(profile, image);
      },
      withTimeout: false
    );
  }
}
