import 'package:dartz/dartz.dart';
import 'package:delivery_app_test/core/error/failure.dart';
import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';

abstract class DishRepository {
  Future<Either<Failure, List<DishEntity>>> getAllDishes();
}
