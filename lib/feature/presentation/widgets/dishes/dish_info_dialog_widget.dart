import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DishInfoDialogWidget extends StatelessWidget {
  final DishEntity dish;

  const DishInfoDialogWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 232,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color.fromARGB(255, 248, 247, 245),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.network(dish.imageUrl),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  SvgPicture.asset('assets/icons/favorite.svg'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: SvgPicture.asset('assets/icons/close.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    dish.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Text(
                        '${dish.price} ₽',
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        ' • ${dish.weight}г',
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text(
                    dish.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(16.0),
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context)
                          .add(AddDishEvent(dish: dish));
                    },
                    color: const Color.fromARGB(255, 51, 100, 224),
                    child: const Text(
                      'Добавить в корзину',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
