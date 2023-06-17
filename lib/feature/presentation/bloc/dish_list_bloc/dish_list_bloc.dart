import 'dart:async';

import 'package:delivery_app_test/core/error/failure.dart';
import 'package:delivery_app_test/feature/domain/usecases/get_all_dishes.dart';
import 'package:delivery_app_test/feature/presentation/bloc/dish_list_bloc/dish_list_event.dart';
import 'package:delivery_app_test/feature/presentation/bloc/dish_list_bloc/dish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class DishListBloc extends Bloc<DishListEvent, DishListState> {
  final GetAllDishes getAllDishes;

  DishListBloc({required this.getAllDishes}) : super(DishListEmpty()) {
    on<FetchDishList>(_onEvent);
  }

  FutureOr<void> _onEvent(
      FetchDishList event, Emitter<DishListState> emit) async {
    emit(DishListLoading());
    final failureOrDishes = await getAllDishes(GetAllDishesParams());
    emit(failureOrDishes.fold(
        (failure) => DishListError(message: _mapFailureToMessage(failure)),
        (dishList) => DishListLoaded(dishes: dishList)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
