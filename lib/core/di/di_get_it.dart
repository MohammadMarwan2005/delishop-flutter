import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/repo/categoy_repo.dart';
import 'package:delishop/core/data/repo/ga_repo.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/core/lang/lang_code_cubit.dart';
import 'package:delishop/feature/account/cubit/account_cubit.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:delishop/feature/cart/cubit/cart_cubit.dart';
import 'package:delishop/feature/favorite/favorite_cubit.dart';
import 'package:delishop/feature/home/home_cubit.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../feature/cart/logic/get_order_enitity_use_case.dart';
import '../data/api_service.dart';
import '../data/db_service.dart';
import '../data/repo/auth_repo.dart';
import '../data/repo/favorite_repo.dart';
import '../data/repo/product_repo.dart';
import '../data/repo/store_repo.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  await Firebase.initializeApp();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  getIt.registerLazySingleton<FirebaseAnalytics>(() => analytics);

  final database = await openDatabase(
    'delishop.db',
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE cart('
            'id INTEGER PRIMARY KEY, '
            'storeId INTEGER, '
            'name TEXT, '
            'description TEXT, '
            'productPicture TEXT, '
            'price TEXT, '
            'discount TEXT, '
            'quantity INTEGER)',
      );
    },
  );
  getIt.registerLazySingleton<DBService>(() => DBService(database));

  getIt.registerLazySingleton<GetOrderEntitiesUseCase>(() => GetOrderEntitiesUseCase(getIt()));

  getIt.registerFactory<CartCubit>(() => CartCubit(getIt(), getIt()));

  getIt.registerLazySingleton<GARepo>(() => GARepo(analytics: analytics));

  final sharedPrefs = await SharedPreferences.getInstance();
  const storage = FlutterSecureStorage();
  getIt.registerLazySingleton<UserDataRepo>(
      () => UserDataRepo(sharedPrefs: sharedPrefs, storage: storage));

  getIt.registerLazySingleton<ApiService>(() => ApiService(
        httpClient: http.Client(),
        userDataRepo: getIt(),
      ));
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Auth
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepo(apiService: getIt(), connectivity: getIt()));
  getIt.registerLazySingleton<AuthCubit>(() =>
      AuthCubit(authRepo: getIt(), userDataRepo: getIt(), gaRepo: getIt()));

  getIt.registerLazySingleton<LangCodeCubit>(() => LangCodeCubit(getIt(), getIt()));

  // account
  getIt.registerFactory<AccountCubit>(
      () => AccountCubit(userDataRepo: getIt(), gaRepo: getIt(), dbService: getIt()));

  getIt.registerLazySingleton<ProductRepo>(
      () => ProductRepo(apiService: getIt(), connectivity: getIt()));

  getIt.registerLazySingleton<StoreRepo>(
      () => StoreRepo(apiService: getIt(), connectivity: getIt()));

  getIt.registerLazySingleton<CategoryRepo>(
      () => CategoryRepo(apiService: getIt(), connectivity: getIt()));
  getIt.registerLazySingleton<FavoriteRepo>(
      () => FavoriteRepo(apiService: getIt(), connectivity: getIt()));

  // home
  getIt.registerFactory<HomeCubit>(() => HomeCubit(
        storeRepo: getIt(),
        productRepo: getIt(),
        categoryRepo: getIt(),
        userDataRepo: getIt(),
        gaRepo: getIt(),
      ));

  getIt.registerFactory<FavoriteCubit>(() => FavoriteCubit(
      favoriteRepo: getIt(), gaRepo: getIt(), userDataRepo: getIt()));
}
