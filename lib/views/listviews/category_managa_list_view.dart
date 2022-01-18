import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/repository/category_repository.dart';

class CategoryManageListView extends StatefulWidget {
  final CategoryRepository categoryRepository;
  final List<Category> categoryList;
  const CategoryManageListView(
      {Key? key, required this.categoryRepository, required this.categoryList})
      : super(key: key);

  @override
  _CategoryManageListViewState createState() => _CategoryManageListViewState();
}

class _CategoryManageListViewState extends State<CategoryManageListView> {
  _CategoryManageListViewState();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          String name = widget.categoryList[index].name;
          String img = widget.categoryList[index].img;
          String? id = widget.categoryList[index].id;
          Size size = MediaQuery.of(context).size;
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  img,
                  fit: BoxFit.fill,
                  height: size.height * 0.15,
                  width: size.width * 0.2,
                ),
                SizedBox(
                  width: size.width * 0.3,
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Category category = widget.categoryList[index];
                    category.setName(name);
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.blue,
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {
                    widget.categoryRepository.deleteCategory(id!);
                    setState(() {
                      widget.categoryList.removeAt(index);
                    });
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  iconSize: 40,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
