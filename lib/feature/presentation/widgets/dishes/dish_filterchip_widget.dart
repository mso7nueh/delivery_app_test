import 'package:delivery_app_test/feature/presentation/bloc/dish_list_bloc/dish_list_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/dish_list_bloc/dish_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishFilterChipWidget extends StatefulWidget {
  const DishFilterChipWidget({super.key});

  @override
  State<DishFilterChipWidget> createState() => _DishFilterChipWidgetState();
}

class _DishFilterChipWidgetState extends State<DishFilterChipWidget> {
  static const List<String> categories = [
    'Все меню',
    'Салаты',
    'С рисом',
    'С рыбой',
    'Роллы'
  ];

  Set<String> filters = <String>{'Все меню'};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 12, right: 12.0),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (category) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: FilterChip(
                  showCheckmark: false,
                  selectedColor: const Color.fromARGB(255, 51, 100, 224),
                  selected: filters.contains(category),
                  labelPadding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 2, top: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: filters.contains(category)
                        ? Colors.white
                        : Colors.black,
                  ),
                  label: Text(
                    category,
                  ),
                  onSelected: (selected) {
                    setState(
                      () {
                        if (selected) {
                          filters.add(category);
                          BlocProvider.of<DishListBloc>(context, listen: false)
                              .add(FetchDishList(filters: filters));
                        } else {
                          if (filters.length > 1) filters.remove(category);
                          BlocProvider.of<DishListBloc>(context, listen: false)
                              .add(FetchDishList(filters: filters));
                        }
                      },
                    );
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
