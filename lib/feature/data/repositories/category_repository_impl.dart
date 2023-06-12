import 'package:dartz/dartz.dart';
import 'package:delivery_app_test/core/error/exception.dart';
import 'package:delivery_app_test/core/error/failure.dart';
import 'package:delivery_app_test/core/platform/network_info.dart';
import 'package:delivery_app_test/feature/data/datasources/category_remote_data_source.dart';
import 'package:delivery_app_test/feature/data/models/category_model.dart';
import 'package:delivery_app_test/feature/domain/entities/category_entity.dart';
import 'package:delivery_app_test/feature/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    return await _getCategories(() {
      return remoteDataSource.getCategories();
    });
  }

  Future<Either<Failure, List<CategoryModel>>> _getCategories(
      Future<List<CategoryModel>> Function() getCategories) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategories = await getCategories();
        return Right(remoteCategories);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // final localCategories = await localDataSource.getCategoriesFromCache();
        final localCategories = await getCategories();
        return Right(localCategories);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
