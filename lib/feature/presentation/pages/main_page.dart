import 'package:delivery_app_test/feature/presentation/widgets/bottom_navigation_bar.dart';
import 'package:delivery_app_test/feature/presentation/widgets/category_list_widget.dart';
import 'package:delivery_app_test/feature/presentation/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppBar(height: 57.0),
        bottomNavigationBar: MyBottomNavigationBar(),
        body: CategoryList(),
      ),
    );
  }
}
