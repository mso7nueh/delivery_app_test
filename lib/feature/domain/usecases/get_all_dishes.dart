import 'package:dartz/dartz.dart';
import 'package:delivery_app_test/core/error/failure.dart';
import 'package:delivery_app_test/core/usecases/usecase.dart';
import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:delivery_app_test/feature/domain/repositories/dish_repository.dart';
import 'package:equatable/equatable.dart';

class GetAllDishes extends UseCase<List<DishEntity>, GetAllDishesParams> {
  final DishRepository dishRepository;

  GetAllDishes(this.dishRepository);

  @override
  Future<Either<Failure, List<DishEntity>>> call(
      GetAllDishesParams params) async {
    return await dishRepository.getAllDishes();
  }
}

class GetAllDishesParams extends Equatable {
  @override
  List<Object?> get props => [];
}
