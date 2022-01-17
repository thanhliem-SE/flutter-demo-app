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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
            color: Colors.green,
            iconSize: 50,
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: [
          FutureBuilder<List<Category>>(
            future: futureCategoryList,
            builder: (context, future) {
              if (!future.hasData) {
                return Container();
              } // return empty container
              else {
                List<Category>? categoryList = future.data;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoryList?.length,
                    itemBuilder: (context, index) {
                      String? name = categoryList?[index].name;
                      String? img = categoryList?[index].img;
                      Size size = MediaQuery.of(context).size;
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              img!,
                              fit: BoxFit.fill,
                              height: size.height * 0.15,
                              width: size.width * 0.2,
                            ),
                            SizedBox(
                              width: size.width * 0.3,
                              child: Text(
                                name!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                              color: Colors.blue,
                              iconSize: 40,
                            ),
                            IconButton(
                              onPressed: () {},
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
            },
          ),
        ],
      ),
    );
  }
}
