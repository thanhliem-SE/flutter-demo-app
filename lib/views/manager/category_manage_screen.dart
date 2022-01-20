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
  late List<String> listIdToDelete;
  late int numSelectedItem;
  final GlobalKey<CategoryManageListViewState> _key = GlobalKey();

  @override
  void initState() {
    numSelectedItem = 0;
    listIdToDelete = [];

    categoryService = CategoryService();
    futureCategoryList = categoryService.getListCategory();
    customAppBar = categoryManageAppBar(context, numSelectedItem);
    super.initState();
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
                  key: _key,
                  categoryList: _categoryList,
                  notifyCheckListState: notifyCheckListState,
                  notifyListIdToDelete: notifyListIdToDelete);
            }
          },
        ),
      ],
    );
  }

  AppBar categoryManageAppBar(BuildContext context, int num) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text("Category Manage"),
      actions: [
        IconButton(
          onPressed: () {
            Category category = Category(
                name: generateRandomString(10),
                img:
                    "https://images.unsplash.com/photo-1567620832903-9fc6debc209f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2hpY2tlbiUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80",
                description: generateRandomString(40),
                index: _categoryList.length);

            categoryService.addCategory(category);
            _key.currentState?.addItemToList(category);
          },
          icon: const Icon(Icons.add_rounded),
          color: Colors.green,
          iconSize: 50,
        ),
      ],
    );
  }

  AppBar checkListStateAppBar(BuildContext context, int num) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text("$num item selected"),
      leading: IconButton(
        onPressed: () {
          setState(() {
            refeshAppBar(context);
          });
        },
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
          color: Colors.blue,
        ),
        IconButton(
          onPressed: () {
            _key.currentState?.removeItemFormList();
            // categoryService.deleteListCategory(listIdToDelete);
            setState(() {
              refeshAppBar(context);
            });
          },
          icon: const Icon(Icons.delete),
          color: Colors.red,
        ),
        IconButton(
          onPressed: () {
            _key.currentState?.selectAllItems();
          },
          icon: const Icon(Icons.select_all),
        )
      ],
    );
  }

  void refeshAppBar(BuildContext context) {
    numSelectedItem = 0;
    customAppBar = categoryManageAppBar(context, numSelectedItem);
    _key.currentState?.hideCheckBox();
    listIdToDelete.clear();
  }

  notifyCheckListState() {
    setState(() {
      customAppBar = checkListStateAppBar(context, numSelectedItem);
    });
  }

  notifyListIdToDelete(int num) {
    numSelectedItem = num;
    setState(() {
      customAppBar = checkListStateAppBar(context, numSelectedItem);
    });
  }
}
