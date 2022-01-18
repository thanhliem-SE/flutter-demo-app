import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/repository/category_repository.dart';
import 'package:food_ordering_app/until/constants.dart';
import 'package:food_ordering_app/views/components/bottom_nav_bar.dart';
import 'package:food_ordering_app/views/listviews/category_managa_list_view.dart';

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
      appBar: categoryManageAppBar(context),
      bottomNavigationBar: const BottomNavBar(),
      body: categoryManageBody(),
    );
  }

  Column categoryManageBody() {
    return Column(
      children: [
        FutureBuilder<List<Category>>(
          future: futureCategoryList,
          builder: (context, future) {
            if (!future.hasData) {
              return Container();
            } // return empty container
            else {
              List<Category>? categoryList = future.data;
              return CategoryManageListView(
                  categoryRepository: categoryRepository,
                  categoryList: categoryList!);
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
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.black,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Category category = Category(
                name: generateRandomString(10),
                img: "https://cdn.quantrinhahang.edu.vn/wp-content/uploads/2019/06/fast-food-la-gi.jpg");

            try {
              categoryRepository.addCategory(category);
              setState(() {
                futureCategoryList = categoryRepository.getListCategory();
              });

              // ignore: empty_catches
            } on Exception catch (_) {
              
            }
          },
          icon: const Icon(Icons.add_rounded),
          color: Colors.green,
          iconSize: 50,
        ),
      ],
    );
  }
}
