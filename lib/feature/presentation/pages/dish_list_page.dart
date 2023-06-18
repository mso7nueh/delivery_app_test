import 'package:delivery_app_test/feature/presentation/widgets/bottom_navigation_bar.dart';
import 'package:delivery_app_test/feature/presentation/widgets/dish_list_app_bar.dart';
import 'package:delivery_app_test/feature/presentation/widgets/dish_list_widget.dart';
import 'package:flutter/material.dart';

class DishPage extends StatefulWidget {
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
  State<DishPage> createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  Set<String> filters = <String>{'Все меню'};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: DishListAppBar(
          height: 57.0,
          categoryName: widget.categoryName,
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
        body: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 12, right: 12.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: DishPage.categories
                    .map(
                      (category) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FilterChip(
                          showCheckmark: false,
                          selectedColor:
                              const Color.fromARGB(255, 51, 100, 224),
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
                            setState(() {
                              if (selected) {
                                filters.add(category);
                              } else {
                                filters.remove(category);
                              }
                            });
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Expanded(child: DishList()),
          ],
        ),
      ),
    );
  }
}
