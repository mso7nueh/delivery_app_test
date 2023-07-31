import 'package:dartz/dartz.dart';
import 'package:delivery_app_test/core/error/exception.dart';
import 'package:delivery_app_test/core/error/failure.dart';
import 'package:delivery_app_test/core/platform/network_info.dart';
import 'package:delivery_app_test/feature/data/datasources/dish_remote_data_source.dart';
import 'package:delivery_app_test/feature/data/models/dish_model.dart';
import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:delivery_app_test/feature/domain/repositories/dish_repository.dart';

class DishRepositoryImpl implements DishRepository {
  final DishRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DishRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<DishEntity>>> getAllDishes() async {
    return await _getAllDishes(() {
      return remoteDataSource.getAllDishes();
    });
  }

  Future<Either<Failure, List<DishModel>>> _getAllDishes(
      Future<List<DishModel>> Function() getAllDishes) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDishes = await getAllDishes();
        return Right(remoteDishes);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // final localDishes = await localDataSource.getAllDishesFromCache();
        final localDishes = await getAllDishes();
        return Right(localDishes);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
