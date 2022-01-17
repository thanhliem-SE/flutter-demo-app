import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/repo/category_repository.dart';
import 'package:food_ordering_app/views/components/bottom_nav_bar.dart';

class CategoryManage extends StatefulWidget {
  const CategoryManage({Key? key}) : super(key: key);

  @override
  _CategoryManageState createState() => _CategoryManageState();
}

class _CategoryManageState extends State<CategoryManage> {
  late CategoryRepository categoryRepository = CategoryRepository();
  late Future<List<Category>> futureCategoryList;

  @override
  void initState() {
    super.initState();
    futureCategoryList = categoryRepository.getListCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Category Manage"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
