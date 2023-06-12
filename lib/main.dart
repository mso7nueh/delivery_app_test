import 'package:delivery_app_test/feature/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:delivery_app_test/feature/presentation/widgets/category_list_widget.dart';
import 'package:delivery_app_test/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app_test/locator_service.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

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
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryListCubit>(
            create: (context) => sl<CategoryListCubit>()..loadCategories()),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: CategoryList(),
        ),
      ),
    );
  }
}
