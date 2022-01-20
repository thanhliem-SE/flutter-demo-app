import 'dart:convert';

import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/until/constants.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<Category> getCategory(String id) async {
    final response = await http.get(Uri.parse("$urlCategoryAPI/$id"));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception("Failed to load category with id: $id");
    }
  }

  Future<List<Category>> getListCategory() async {
    final response = await http.get(Uri.parse(urlCategoryAPI));
    if (response.statusCode == 200) {
      return categoryListFromJson(response.body);
    } else {
      throw Exception("Failed to load category");
    }
  }

  Future<bool> deleteCategory(String? id) async {
    final http.Response response = await http.delete(
      Uri.parse("$urlCategoryAPI/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<Category> addCategory(Category category) async {
    final response = await http.post(Uri.parse(urlCategoryAPI),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(category.toJson()));

    if (response.statusCode == 201) {
      return category;
    } else {
      throw Exception("Failed to create Category");
    }
  }

  Future<Category> updateCategory(Category category, String id) async {
    // print("$urlCategoryAPI/$id");
    final response = await http.put(Uri.parse("$urlCategoryAPI/$id/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(category.toJson()));
    // print(response.statusCode);

    if (response.statusCode == 200) {
      return category;
    } else {
      throw Exception("Failed to update Category");
    }
  }

  void deleteListCategory(List<String> listId) {
    for (String id in listId) {
      deleteCategory(id);
    }
  }
}
