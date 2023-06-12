import 'package:dartz/dartz.dart';
import 'package:delivery_app_test/core/error/failure.dart';
import 'package:delivery_app_test/core/usecases/usecase.dart';
import 'package:delivery_app_test/feature/domain/entities/category_entity.dart';
import 'package:delivery_app_test/feature/domain/repositories/category_repository.dart';
import 'package:equatable/equatable.dart';

class GetAllCategories
    extends UseCase<List<CategoryEntity>, GetAllCategoriesParams> {
  final CategoryRepository categoryRepository;

  GetAllCategories(this.categoryRepository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(
      GetAllCategoriesParams params) async {
    return await categoryRepository.getAllCategories();
  }
}

class GetAllCategoriesParams extends Equatable {
  @override
  List<Object?> get props => [];
}
