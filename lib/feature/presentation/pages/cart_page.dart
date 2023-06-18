import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:delivery_app_test/feature/presentation/widgets/bottom_navigation_bar.dart';
import 'package:delivery_app_test/feature/presentation/widgets/cart_list_widget.dart';
import 'package:delivery_app_test/feature/presentation/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context, listen: false)
        .add(FetchCartListEvent());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppBar(height: 57.0),
        bottomNavigationBar: const MyBottomNavigationBar(),
        body: const CartListWidget(),
      ),
    );
  }
}
