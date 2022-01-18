import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/repository/category_repository.dart';
import 'package:food_ordering_app/until/constants.dart';
import 'package:food_ordering_app/views/listviews/category_manage_list_view.dart';

class CategoryManage extends StatefulWidget {
  const CategoryManage({Key? key}) : super(key: key);

  @override
  _CategoryManageState createState() => _CategoryManageState();
}

class _CategoryManageState extends State<CategoryManage> {
  late CategoryRepository categoryRepository;
  late Future<List<Category>> futureCategoryList;
  late List<Category> _categoryList;

  @override
  void initState() {
    super.initState();
    categoryRepository = CategoryRepository();
    futureCategoryList = categoryRepository.getListCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoryManageAppBar(context),
      body: categoryManageBody(),
    );
  }

  Column categoryManageBody() {
    return Column(
      children: [
        // SearchBox(onChanged: (value) {}),
        FutureBuilder<List<Category>>(
          future: futureCategoryList,
          builder: (context, future) {
            if (!future.hasData) {
              return Container();
            } // return empty container
            else {
              _categoryList = future.data!;
              return CategoryManageListView(categoryList: _categoryList);
            }
          },
        ),
      ],
    );
  }

  AppBar categoryManageAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text("Category Manage"),
      actions: [
        IconButton(
          onPressed: () {
            Category category = Category(
                name: generateRandomString(10),
                img: "https://picsum.photos/300/");

            categoryRepository.addCategory(category);
            setState(() {
              _categoryList.add(category);
            });
          },
          icon: const Icon(Icons.add_rounded),
          color: Colors.green,
          iconSize: 50,
        ),
      ],
    );
  }
}
