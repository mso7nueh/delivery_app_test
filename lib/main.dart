import 'package:delivery_app_test/feature/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:delivery_app_test/feature/presentation/widgets/category_list_widget.dart';
import 'package:delivery_app_test/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app_test/locator_service.dart' as di;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryListCubit>(
            create: (context) => sl<CategoryListCubit>()..loadCategories()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).scaffoldBackgroundColor,
              systemNavigationBarColor:
                  Theme.of(context).scaffoldBackgroundColor,
            ),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leadingWidth: 200,
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 6.0),
                    child: SvgPicture.asset(
                      'assets/icons/location.svg',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Санкт-Петербург',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            '12 августа, 2023',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color.fromARGB(128, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 22,
                  child: Image.asset('assets/images/avatar.png'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
            currentIndex: index,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color.fromARGB(255, 51, 100, 224),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
            selectedIconTheme: IconThemeData(
              color: Color.fromARGB(255, 51, 100, 224),
            ),
            showUnselectedLabels: true,
            unselectedItemColor: Color.fromARGB(255, 165, 169, 178),
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: SvgPicture.asset(
                      'assets/icons/home.svg',
                      color: index == 0
                          ? Color.fromARGB(255, 51, 100, 224)
                          : Color.fromARGB(255, 165, 169, 178),
                    ),
                  ),
                  label: 'Главная'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: index == 1
                          ? Color.fromARGB(255, 51, 100, 224)
                          : Color.fromARGB(255, 165, 169, 178),
                    ),
                  ),
                  label: 'Поиск'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: SvgPicture.asset(
                      'assets/icons/cart.svg',
                      color: index == 2
                          ? Color.fromARGB(255, 51, 100, 224)
                          : Color.fromARGB(255, 165, 169, 178),
                    ),
                  ),
                  label: 'Корзина'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: SvgPicture.asset(
                      'assets/icons/account.svg',
                      color: index == 3
                          ? Color.fromARGB(255, 51, 100, 224)
                          : Color.fromARGB(255, 165, 169, 178),
                    ),
                  ),
                  label: 'Аккаунт'),
            ],
          ),
          body: CategoryList(),
        ),
      ),
    );
  }
}
