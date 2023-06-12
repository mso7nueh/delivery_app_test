import 'package:delivery_app_test/feature/domain/entities/category_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryEmpty extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categoryList;

  const CategoryLoaded({required this.categoryList});

  @override
  List<Object?> get props => [categoryList];
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError({required this.message});

  @override
  List<Object?> get props => [message];
}
