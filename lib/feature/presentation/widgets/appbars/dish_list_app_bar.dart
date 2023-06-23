import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
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
        icon: SvgPicture.asset(
          'assets/icons/arrow_back.svg',
        ),
        onPressed: () {
          BlocProvider.of<NavigationBloc>(context)
              .add(const NavigationIndexChange(index: 0, category: ''));
        },
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
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
