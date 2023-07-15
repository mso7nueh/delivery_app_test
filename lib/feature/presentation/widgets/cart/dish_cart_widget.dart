import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DishCartWidget extends StatelessWidget {
  final DishEntity dish;

  const DishCartWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return state.cartMap.containsKey(dish)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 247, 245),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Image.network(dish.imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            dish.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('${dish.price} ₽'),
                            Text(
                              ' • ${dish.weight}г',
                              style: const TextStyle(
                                color: Color.fromARGB(102, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 247, 245),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<CartBloc>(context)
                                .add(RemoveDishEvent(dish: dish));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(6.0, 4.0, 16.0, 4.0),
                            child: SvgPicture.asset('assets/icons/remove.svg'),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                          child: Text(
                            '${state.cartMap[dish]}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<CartBloc>(context)
                                .add(AddDishEvent(dish: dish));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 4.0, 6.0, 4.0),
                            child: SvgPicture.asset('assets/icons/add.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container();
      },
    );
  }
}
