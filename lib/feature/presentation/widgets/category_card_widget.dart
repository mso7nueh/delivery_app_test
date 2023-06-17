import 'package:delivery_app_test/feature/domain/entities/category_entity.dart';
import 'package:delivery_app_test/feature/presentation/pages/dish_list_page.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryCard extends StatefulWidget {
  final CategoryEntity category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DishPage(categoryName: widget.category.name)));
          });
        },
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image.asset(
                  'assets/images/skeleton.png',
                  color: Colors.white,
                ),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget.category.imageUrl,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 16),
              child: Text(
                widget.category.name,
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
