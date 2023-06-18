import 'package:delivery_app_test/core/platform/network_info.dart';
import 'package:delivery_app_test/feature/data/datasources/category_remote_data_source.dart';
import 'package:delivery_app_test/feature/data/datasources/dish_remote_data_source.dart';
import 'package:delivery_app_test/feature/data/repositories/category_repository_impl.dart';
import 'package:delivery_app_test/feature/data/repositories/dish_repository_impl.dart';
import 'package:delivery_app_test/feature/domain/repositories/category_repository.dart';
import 'package:delivery_app_test/feature/domain/repositories/dish_repository.dart';
import 'package:delivery_app_test/feature/domain/usecases/get_all_categories.dart';
import 'package:delivery_app_test/feature/domain/usecases/get_all_dishes.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:delivery_app_test/feature/presentation/bloc/dish_list_bloc/dish_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(
    () => CartBloc(),
  );

  sl.registerFactory(
    () => CategoryListCubit(getAllCategories: sl<GetAllCategories>()),
  );

  sl.registerFactory(
    () => DishListBloc(getAllDishes: sl<GetAllDishes>()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetAllDishes(sl()));

  // Repository
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<DishRepository>(
    () => DishRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // DataSources
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<DishRemoteDataSource>(
    () => DishRemoteDataSourceImpl(client: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
