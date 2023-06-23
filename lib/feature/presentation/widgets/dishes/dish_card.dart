import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:delivery_app_test/feature/presentation/widgets/dishes/dish_info_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class DishCard extends StatelessWidget {
  final DishEntity dish;

  const DishCard({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return DishInfoDialogWidget(dish: dish);
          },
        ),
        child: Container(
          margin: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    height: 109,
                    width: 109,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color.fromARGB(255, 248, 247, 245),
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: dish.imageUrl,
                    ),
                  ),
                  state.cartMap.containsKey(dish)
                      ? Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 109,
                          width: 109,
                          child: Text(
                            '${state.cartMap[dish]}',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  dish.name,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
