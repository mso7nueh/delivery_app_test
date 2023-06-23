import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  final Map<DishEntity, int> cartMap;
  final int cartSum;

  const CartState({required this.cartMap, required this.cartSum});

  @override
  List<Object> get props => [cartMap, cartSum];
}

class DishAddedState extends CartState {
  @override
  final Map<DishEntity, int> cartMap;
  @override
  final int cartSum;

  const DishAddedState({required this.cartMap, required this.cartSum})
      : super(cartMap: cartMap, cartSum: cartSum);

  @override
  List<Object> get props => [cartMap, cartSum];
}

class DishRemovedState extends CartState {
  @override
  final Map<DishEntity, int> cartMap;
  @override
  final int cartSum;

  const DishRemovedState({required this.cartMap, required this.cartSum})
      : super(cartMap: cartMap, cartSum: cartSum);

  @override
  List<Object> get props => [cartMap, cartSum];
}
