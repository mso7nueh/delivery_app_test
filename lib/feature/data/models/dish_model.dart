import 'package:delivery_app_test/feature/domain/entities/dish_entity.dart';

class DishModel extends DishEntity {
  const DishModel({
    required id,
    required name,
    required price,
    required weight,
    required description,
    required imageUrl,
    required tegs,
  }) : super(
          id: id,
          name: name,
          price: price,
          weight: weight,
          description: description,
          imageUrl: imageUrl,
          tegs: tegs,
        );

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      weight: json['weight'] as int,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      tegs: json['tegs'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'weight': weight,
      'description': description,
      'image_url': imageUrl,
      'tegs': tegs,
    };
  }
}
