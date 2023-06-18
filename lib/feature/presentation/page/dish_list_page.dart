import 'package:delivery_app_test/feature/presentation/widgets/dish_filterchip_widget.dart';
import 'package:delivery_app_test/feature/presentation/widgets/dish_list_widget.dart';
import 'package:flutter/material.dart';

class DishListPage extends StatelessWidget {
  const DishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DishFilterChipWidget(),
        Expanded(child: DishList()),
      ],
    );
  }
}
