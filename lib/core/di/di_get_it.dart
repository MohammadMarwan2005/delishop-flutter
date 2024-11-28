import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../data/api_service.dart';
import '../data/repo/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerLazySingleton<ApiService>(() => ApiService(
        httpClient: http.Client(),
      ));
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  final sharedPrefs = await SharedPreferences.getInstance();
  const storage = FlutterSecureStorage();
  getIt.registerLazySingleton<UserDataRepo>(
      () => UserDataRepo(sharedPrefs: sharedPrefs, storage: storage));

  // Auth
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepo(apiService: getIt(), connectivity: getIt()));
  getIt.registerLazySingleton<AuthCubit>(
      () => AuthCubit(authRepo: getIt(), userDataRepo: getIt()));
}
