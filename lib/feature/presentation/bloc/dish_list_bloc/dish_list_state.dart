import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:equatable/equatable.dart';

abstract class DishListState extends Equatable {
  const DishListState();

  @override
  List<Object> get props => [];
}

class DishListEmpty extends DishListState {}

class DishListLoading extends DishListState {}

class DishListLoaded extends DishListState {
  final List<DishEntity> dishes;

  const DishListLoaded({required this.dishes});

  @override
  List<Object> get props => [dishes];
}

class DishListError extends DishListState {
  final String message;

  const DishListError({required this.message});

  @override
  List<Object> get props => [message];
}
