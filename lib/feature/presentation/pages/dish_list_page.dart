import 'package:delivery_app_test/feature/presentation/widgets/bottom_navigation_bar.dart';
import 'package:delivery_app_test/feature/presentation/widgets/dish_list_app_bar.dart';
import 'package:delivery_app_test/feature/presentation/widgets/dish_list_widget.dart';
import 'package:flutter/material.dart';

class DishPage extends StatelessWidget {
  final String categoryName;
  static const List<String> categories = [
    'Все меню',
    'Салаты',
    'С рисом',
    'С рыбой',
    'Роллы'
  ];

  const DishPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: DishListAppBar(
          height: 57.0,
          categoryName: categoryName,
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
        body: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 12, right: 12.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .map((category) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FilterChip(
                              labelPadding: EdgeInsets.only(
                                  left: 12, right: 12, bottom: 2, top: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              label: Text(category),
                              onSelected: (selected) {}),
                        ))
                    .toList(),
              ),
            ),
            Expanded(child: DishList()),
          ],
        ),
      ),
    );
  }
}
