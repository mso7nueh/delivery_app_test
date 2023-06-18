import 'package:badges/badges.dart' as badges;
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:delivery_app_test/feature/presentation/bloc/navigation_bloc/navigation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final index;

  const MyBottomNavigationBar({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (index) {
            BlocProvider.of<NavigationBloc>(context)
                .add(NavigationIndexChange(index: index, category: ''));
          },
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 51, 100, 224),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
          selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 51, 100, 224),
          ),
          showUnselectedLabels: true,
          unselectedItemColor: const Color.fromARGB(255, 165, 169, 178),
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    color: index == 0
                        ? const Color.fromARGB(255, 51, 100, 224)
                        : const Color.fromARGB(255, 165, 169, 178),
                  ),
                ),
                label: 'Главная'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    color: index == 1
                        ? const Color.fromARGB(255, 51, 100, 224)
                        : const Color.fromARGB(255, 165, 169, 178),
                  ),
                ),
                label: 'Поиск'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                  child: badges.Badge(
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Colors.red,
                      elevation: 0,
                    ),
                    badgeContent: Text(
                      state.cartMap.isNotEmpty
                          ? '${state.cartMap.values.toList().reduce((value, element) => value + element)}'
                          : '0',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    showBadge: state.cartMap.isNotEmpty,
                    child: SvgPicture.asset(
                      'assets/icons/cart.svg',
                      color: index == 2
                          ? const Color.fromARGB(255, 51, 100, 224)
                          : const Color.fromARGB(255, 165, 169, 178),
                    ),
                  ),
                ),
                label: 'Корзина'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                  child: SvgPicture.asset(
                    'assets/icons/account.svg',
                    color: index == 3
                        ? const Color.fromARGB(255, 51, 100, 224)
                        : const Color.fromARGB(255, 165, 169, 178),
                  ),
                ),
                label: 'Аккаунт'),
          ],
        );
      },
    );
  }
}
