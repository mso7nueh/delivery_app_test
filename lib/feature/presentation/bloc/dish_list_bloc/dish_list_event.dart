import 'package:equatable/equatable.dart';

abstract class DishListEvent extends Equatable {
  const DishListEvent();

  @override
  List<Object> get props => [];
}

class FetchDishList extends DishListEvent {
  final Set<String> filters;
  const FetchDishList({required this.filters});

  @override
  List<Object> get props => [filters];
}
