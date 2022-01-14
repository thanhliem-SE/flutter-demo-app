import 'package:flutter/material.dart';
import 'package:food_ordering_app/views/home/components/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Combo Meal",
            isActive: true,
            press: () {},
          ),
          CategoryItem(
            title: "Chicken",
            isActive: false,
            press: () {},
          ),
          CategoryItem(
            title: "Beverages",
            isActive: false,
            press: () {},
          ),
          CategoryItem(
            title: "Snacks & Sides",
            isActive: false,
            press: () {},
          ),
        ],
      ),
    );
  }
}
