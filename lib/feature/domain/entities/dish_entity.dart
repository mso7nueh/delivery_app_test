import 'package:equatable/equatable.dart';

class DishEntity extends Equatable {
  final int id;
  final String name;
  final int price;
  final int weight;
  final String description;
  final String imageUrl;
  final List<dynamic> tegs;

  const DishEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.imageUrl,
    required this.tegs,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        weight,
        description,
        imageUrl,
        tegs,
      ];
}
