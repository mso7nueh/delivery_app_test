import 'package:delivery_app_test/feature/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required id,
    required name,
    required imageUrl,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
    };
  }
}
