import 'package:delivery_app_test/feature/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Image.network(
              category.imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 16),
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
