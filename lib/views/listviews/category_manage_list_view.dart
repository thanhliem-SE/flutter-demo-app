// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/service/category_service.dart';
import 'package:food_ordering_app/until/constants.dart';
import 'package:food_ordering_app/views/home/components/category_list.dart';

class CategoryManageListView extends StatefulWidget {
  final List<Category> categoryList;
  final Function() notifyCheckListState;
  final Function(String, String) notifyListIdToDelete;

  const CategoryManageListView(
      {Key? key,
      required this.categoryList,
      required this.notifyCheckListState,
      required this.notifyListIdToDelete})
      : super(key: key);

  @override
  CategoryManageListViewState createState() => CategoryManageListViewState();
}

class CategoryManageListViewState extends State<CategoryManageListView> {
  late CategoryService categoryService;
  late List<Category> categoryList;
  late List<bool> isChecked;
  late bool isVisible;
  late List<Category> listCategoryToRemove;
  late List<String> listIdToRemove;

  CategoryManageListViewState();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    categoryList = widget.categoryList;
    categoryService = CategoryService();
    listIdToRemove = [];
    isChecked = List<bool>.filled(categoryList.length, false);
    isVisible = false;
    listCategoryToRemove = [];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          Category category = categoryList[index];
          String name = category.name;
          String img = category.img;
          String? id = category.id;
          Size size = MediaQuery.of(context).size;
          return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      child: categoryManageItem(category, index, id))));
        },
      ),
    );
  }

  Padding categoryManageItem(Category category, int index, String? id) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onLongPress: () {
          if (!isVisible) {
            setState(() {
              isVisible = true;
              widget.notifyCheckListState();
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              category.img,
              fit: BoxFit.fill,
              height: size.height * 0.15,
              width: size.width * 0.2,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset(
                  'assets/images/no_img.jpg',
                  height: size.height * 0.15,
                  width: size.width * 0.2,
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      category.description,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                String nameUpdate = generateRandomString(10);
                category.setName = nameUpdate;

                categoryService.updateCategory(category, category.id);
                setState(() {
                  categoryList[index].setName = nameUpdate;
                });
              },
              icon: const Icon(Icons.edit),
              color: Colors.blue,
              iconSize: 40,
            ),
            Visibility(
              visible: isVisible,
              child: SizedBox(
                width: 30,
                child: CheckboxListTile(
                  value: isChecked[index],
                  onChanged: (val) {
                    String _id = categoryList[index].getId;
                    if (isChecked[index] == false) {
                      widget.notifyListIdToDelete(_id, "add");
                      listIdToRemove.add(_id);
                      listCategoryToRemove.add(categoryList[index]);
                    } else {
                      widget.notifyListIdToDelete(_id, "remove");
                      listIdToRemove.remove(_id);
                      listCategoryToRemove.remove(categoryList[index]);
                    }
                    setState(() {
                      isChecked[index] = val!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Receiver call from parent widget
  void hideCheckBox() {
    isVisible = false;
    isChecked = List<bool>.filled(categoryList.length, false);
    listCategoryToRemove.clear();
    listIdToRemove.clear();
  }

  void addItemToList(Category category) {
    setState(() {
      categoryList.add(category);
      isChecked = List<bool>.filled(categoryList.length, false);
      isVisible = false;
    });
  }

  void removeItemFormList() {
    categoryService.deleteListCategory(listIdToRemove);
    for (int i = 0; i < listCategoryToRemove.length; i++) {
      if (i < (listCategoryToRemove.length - 1)) {
        categoryList.remove(listCategoryToRemove[i]);
      } else {
        setState(() {
          categoryList.remove(listCategoryToRemove[i]);
          hideCheckBox();
        });
      }
    }
  }
}
