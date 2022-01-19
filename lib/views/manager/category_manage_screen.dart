import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/service/category_service.dart';
import 'package:food_ordering_app/until/constants.dart';
import 'package:food_ordering_app/views/listviews/category_manage_list_view.dart';

class CategoryManage extends StatefulWidget {
  const CategoryManage({Key? key}) : super(key: key);

  @override
  _CategoryManageState createState() => _CategoryManageState();
}

class _CategoryManageState extends State<CategoryManage> {
  late CategoryService categoryService;
  late Future<List<Category>> futureCategoryList;
  late List<Category> _categoryList;
  late AppBar customAppBar;
  final GlobalKey<CategoryManageListViewState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    categoryService = CategoryService();
    futureCategoryList = categoryService.getListCategory();
    customAppBar = categoryManageAppBar(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
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
              return CategoryManageListView(
                  categoryList: _categoryList,
                  notifyCheckListState: setCheckListState);
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
                name: generateRandomString(8),
                img:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoJVABt6MH9bcf8mKwLYc34RmP-dAsnHyhwA&usqp=CAU",
                description: generateRandomString(15),
                index: _categoryList.length);

            categoryService.addCategory(category);
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

  AppBar checkListStateAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text("Category Manage"),
      leading: IconButton(
        onPressed: () {
          setState(() {
            customAppBar = categoryManageAppBar(context);
            _key.currentState?.hideCheckBox();
          });
        },
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
          color: Colors.red,
          iconSize: 30,
        ),
      ],
    );
  }

  setCheckListState() {
    setState(() {
      customAppBar = checkListStateAppBar(context);
    });
  }
}
