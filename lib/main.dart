import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:delivery_app_test/feature/presentation/bloc/dish_list_bloc/dish_list_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_state.dart';
import 'package:delivery_app_test/feature/presentation/page/dish_list_page.dart';
import 'package:delivery_app_test/feature/presentation/widgets/appbars/bottom_navigation_bar.dart';
import 'package:delivery_app_test/feature/presentation/widgets/appbars/dish_list_app_bar.dart';
import 'package:delivery_app_test/feature/presentation/widgets/appbars/main_app_bar.dart';
import 'package:delivery_app_test/feature/presentation/widgets/cart/cart_list_widget.dart';
import 'package:delivery_app_test/feature/presentation/widgets/categories/category_list_widget.dart';
import 'package:delivery_app_test/locator_service.dart';
import 'package:delivery_app_test/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryListCubit>(
            create: (context) => sl<CategoryListCubit>()..loadCategories()),
        BlocProvider<DishListBloc>(create: (context) => sl<DishListBloc>()),
        BlocProvider<CartBloc>(create: (context) => sl<CartBloc>()),
        BlocProvider<NavigationBloc>(create: (context) => sl<NavigationBloc>()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'SFProDisplay',
        ),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            StatelessWidget? body;
            StatelessWidget? appBar = const MainAppBar();
            if (state.category.isNotEmpty) {
              body = const DishListPage();
              appBar = DishListAppBar(categoryName: state.category);
            } else {
              if (state.index == 0) body = const CategoryList();
              if (state.index == 2) body = const CartListWidget();
            }
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: appBar,
              ),
              body: body,
              bottomNavigationBar: MyBottomNavigationBar(index: state.index),
            );
          },
        ),
      ),
    );
  }
}
