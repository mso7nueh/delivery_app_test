import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String categoryName;
  final double height;

  const DishListAppBar(
      {super.key, required this.categoryName, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      title: Text(
        categoryName,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 18,
        ),
        onPressed: () {
          BlocProvider.of<NavigationBloc>(context)
              .add(const NavigationIndexChange(index: 0, category: ''));
        },
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 22,
            child: Image.asset('assets/images/avatar.png'),
          ),
        ),
      ],
    );
  }
}
