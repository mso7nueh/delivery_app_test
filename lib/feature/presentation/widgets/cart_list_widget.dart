import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:delivery_app_test/feature/presentation/widgets/dish_cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              itemCount: state.cartMap.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == state.cartMap.length) {
                  return const SizedBox(height: 64, width: 64);
                }
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: DishCartWidget(
                          dish: state.cartMap.keys.elementAt(index)),
                    )
                  ],
                );
              },
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16.0),
              child: CupertinoButton(
                  padding: const EdgeInsets.all(16.0),
                  color: const Color.fromARGB(255, 51, 100, 224),
                  onPressed: state.cartSum > 0 ? () {} : null,
                  child: Text(
                    'Оплатить ${NumberFormat.simpleCurrency(locale: 'ru-RU', decimalDigits: 0).format(state.cartSum)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }
}
