import 'package:dartz/dartz.dart';
import 'package:delivery_app_test/core/error/failure.dart';
import 'package:delivery_app_test/feature/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}
