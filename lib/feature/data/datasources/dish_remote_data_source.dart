import 'dart:convert';

import 'package:delivery_app_test/core/error/exception.dart';
import 'package:delivery_app_test/feature/data/models/dish_model.dart';
import 'package:http/http.dart' as http;

abstract class DishRemoteDataSource {
  Future<List<DishModel>> getAllDishes();
}

class DishRemoteDataSourceImpl implements DishRemoteDataSource {
  final http.Client client;

  DishRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DishModel>> getAllDishes() async {
    final response = await http.get(
      Uri.parse('https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final dishes = json.decode(response.body);
      return (dishes['dishes'] as List)
          .map((dish) => DishModel.fromJson(dish))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
