import 'package:delivery_app_test/feature/domain/entities/category_entity.dart';
import 'package:delivery_app_test/feature/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:delivery_app_test/feature/presentation/bloc/category_list_cubit/category_lsit_state.dart';
import 'package:delivery_app_test/feature/presentation/widgets/category_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListCubit, CategoryState>(
      builder: (context, state) {
        List<CategoryEntity> categories = [];

        if (state is CategoryLoading) {
          return _loadingIndicator();
        } else if (state is CategoryLoaded) {
          categories = state.categoryList;
        } else if (state is CategoryError) {
          return Text(
            state.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          );
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          },
          itemCount: categories.length,
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
