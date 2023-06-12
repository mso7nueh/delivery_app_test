import 'dart:convert';

import 'package:delivery_app_test/core/error/exception.dart';
import 'package:delivery_app_test/feature/data/models/category_model.dart';
import 'package:http/http.dart' as http;

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;

  CategoryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await http.get(
      Uri.parse('https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final categories = json.decode(response.body);
      return (categories['сategories'] as List)
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
