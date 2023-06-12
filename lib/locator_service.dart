import 'package:delivery_app_test/core/platform/network_info.dart';
import 'package:delivery_app_test/feature/data/datasources/category_remote_data_source.dart';
import 'package:delivery_app_test/feature/data/repositories/category_repository_impl.dart';
import 'package:delivery_app_test/feature/domain/repositories/category_repository.dart';
import 'package:delivery_app_test/feature/domain/usecases/get_all_categories.dart';
import 'package:delivery_app_test/feature/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(
        () => CategoryListCubit(getAllCategories: sl<GetAllCategories>()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllCategories(sl()));

  // Repository
  sl.registerLazySingleton<CategoryRepository>(
        () =>
        CategoryRepositoryImpl(
          remoteDataSource: sl(),
          networkInfo: sl(),
        ),
  );

  sl.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(client: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}