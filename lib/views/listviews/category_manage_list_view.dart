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
  final Function(int) notifyListIdToDelete;

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

    categoryList.sort((a, b) => a.index - b.index);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReorderableListView.builder(
        padding: const EdgeInsets.all(15),
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }

          categoryList[oldIndex].setIndex = newIndex;
          categoryList[newIndex].setIndex = oldIndex;

          categoryService.updateCategory(
              categoryList[oldIndex], categoryList[oldIndex].id);
          categoryService.updateCategory(
              categoryList[newIndex], categoryList[newIndex].id);
          setState(() {
            final Category item = categoryList.removeAt(oldIndex);
            categoryList.insert(newIndex, item);
          });
        },
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          Category category = categoryList[index];
          String name = category.name;
          String img = category.img;
          String? id = category.id;
          Size size = MediaQuery.of(context).size;
          return itemInListView(category, size, index);
        },
      ),
    );
  }

  Widget itemInListView(Category category, Size size, int index) {
    return Container(
      key: Key('$index'),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10),
      color: index.isOdd ? Colors.white10 : Colors.yellow[50],
      child: InkWell(
        onDoubleTap: () {
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
            Visibility(
              visible: isVisible,
              child: SizedBox(
                width: 30,
                child: CheckboxListTile(
                  value: isChecked[index],
                  onChanged: (val) {
                    String _id = categoryList[index].getId;
                    if (isChecked[index] == false) {
                      listIdToRemove.add(_id);
                      listCategoryToRemove.add(categoryList[index]);
                      widget.notifyListIdToDelete(listCategoryToRemove.length);
                    } else {
                      listIdToRemove.remove(_id);
                      listCategoryToRemove.remove(categoryList[index]);
                      widget.notifyListIdToDelete(listCategoryToRemove.length);
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
    listIdToRemove.clear();
    listCategoryToRemove = [];
  }

  void addItemToList(Category category) {
    setState(() {
      isChecked = List<bool>.filled(categoryList.length + 1, false);
      categoryList.add(category);
      isVisible = false;
      categoryList.sort((a, b) => a.index - b.index);
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

  void selectAllItems() {
    listIdToRemove.clear();
    listCategoryToRemove.clear();
    setState(() {
      isChecked = List<bool>.filled(categoryList.length, true);
      for (var element in categoryList) {
        listIdToRemove.add(element.getId);
        listCategoryToRemove.add(element);
        widget.notifyListIdToDelete(listCategoryToRemove.length);
      }
    });
  }
}
