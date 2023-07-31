import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddDishEvent extends CartEvent {
  final DishEntity dish;

  const AddDishEvent({required this.dish});

  @override
  List<Object?> get props => [dish];
}

class RemoveDishEvent extends CartEvent {
  final DishEntity dish;

  const RemoveDishEvent({required this.dish});

  @override
  List<Object?> get props => [dish];
}

class FetchCartListEvent extends CartEvent {}
