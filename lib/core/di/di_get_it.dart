import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/repo/categoy_repo.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/feature/account/cubit/account_cubit.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:delishop/feature/home/home_cubit.dart';
import 'package:delishop/feature/home/home_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../data/api_service.dart';
import '../data/repo/auth_repo.dart';
import '../data/repo/product_repo.dart';
import '../data/repo/store_repo.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  const storage = FlutterSecureStorage();
  getIt.registerLazySingleton<UserDataRepo>(
          () => UserDataRepo(sharedPrefs: sharedPrefs, storage: storage));

  getIt.registerLazySingleton<ApiService>(() => ApiService(
        httpClient: http.Client(), userDataRepo: getIt(),
      ));
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Auth
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepo(apiService: getIt(), connectivity: getIt()));
  getIt.registerLazySingleton<AuthCubit>(
      () => AuthCubit(authRepo: getIt(), userDataRepo: getIt()));

  // account
  getIt.registerLazySingleton<AccountCubit>(
      () => AccountCubit(userDataRepo: getIt()));

  getIt.registerLazySingleton<ProductRepo>(
      () => ProductRepo(apiService: getIt(), connectivity: getIt()));

  getIt.registerLazySingleton<StoreRepo>(
      () => StoreRepo(apiService: getIt(), connectivity: getIt()));

  getIt.registerLazySingleton<CategoryRepo>(
      () => CategoryRepo(apiService: getIt(), connectivity: getIt()));

  // home
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(
        storeRepo: getIt(),
        productRepo: getIt(),
        categoryRepo: getIt(),
      ));
}
