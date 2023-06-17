import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (i) {
        setState(() {
          index = i;
        });
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
              child: SvgPicture.asset(
                'assets/icons/cart.svg',
                color: index == 2
                    ? const Color.fromARGB(255, 51, 100, 224)
                    : const Color.fromARGB(255, 165, 169, 178),
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
  }
}
