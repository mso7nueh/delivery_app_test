import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:delivery_app_test/feature/presentation/bloc/dish_list_bloc/dish_list_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/dish_list_bloc/dish_list_state.dart';
import 'package:delivery_app_test/feature/presentation/widgets/dish_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dish_list_bloc/dish_list_event.dart';

class DishList extends StatelessWidget {
  const DishList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DishListBloc>(context, listen: false)
        .add(const FetchDishList(filters: {'Все меню'}));
    return BlocBuilder<DishListBloc, DishListState>(
      builder: (context, state) {
        List<DishEntity> dishes = [];

        if (state is DishListLoading) {
          return _loadingIndicator();
        } else if (state is DishListLoaded) {
          for (DishEntity dish in state.dishes) {
            bool flagFilter = true;
            for (String filter in state.filters) {
              if (!dish.tegs.contains(filter)) flagFilter = false;
            }
            flagFilter ? dishes.add(dish) : flagFilter = true;
          }
        } else if (state is DishListError) {
          return Text(
            state.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          );
        }

        return GridView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: dishes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.75694444444),
            itemBuilder: (context, i) {
              return DishCard(dish: dishes[i]);
            });
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
