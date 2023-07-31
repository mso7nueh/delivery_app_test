import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  late final Map<DishEntity, int> _cartMap = {};
  int cartSum = 0;

  CartBloc() : super(const DishAddedState(cartMap: {}, cartSum: 0)) {
    on<FetchCartListEvent>((event, emit) {
      emit(DishAddedState(cartMap: cartMap, cartSum: cartSum));
    });

    on<AddDishEvent>((event, emit) {
      _cartMap.containsKey(event.dish)
          ? _cartMap[event.dish] = _cartMap[event.dish]! + 1
          : _cartMap[event.dish] = 1;
      cartSum += event.dish.price;
      emit(DishAddedState(cartMap: cartMap, cartSum: cartSum));
    });

    on<RemoveDishEvent>((event, emit) {
      _cartMap[event.dish]! > 1
          ? _cartMap[event.dish] = _cartMap[event.dish]! - 1
          : _cartMap.remove(event.dish);
      cartSum -= event.dish.price;
      emit(DishRemovedState(cartMap: cartMap, cartSum: cartSum));
    });
  }

  Map<DishEntity, int> get cartMap => _cartMap;
}
