import 'dart:convert';

import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/until/constants.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<Category> getCategory(String id) async {
    final response = await http.get(Uri.parse(urlCategoryAPI + id));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception("Failed to load category with id: $id");
    }
  }

  Future<List<Category>> getListCategory() async {
    final response = await http.get(Uri.parse(urlCategoryAPI));
    if (response.statusCode == 200) {
      return parseCategoryList(response.body);
    } else {
      throw Exception("Failed to load category");
    }
  }

  List<Category> parseCategoryList(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }
}
