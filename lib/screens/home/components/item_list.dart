import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/home/components/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            shopName: "MacDonald's",
            title: "Burger & Beer",
            svgSrc: "assets/icons/burger_beer.svg",
            press: () {},
          ),
          ItemCard(
            shopName: "Wendys",
            title: "Chinese & Noodless",
            svgSrc: "assets/icons/chinese_noodles.svg",
            press: () {},
          ),
          ItemCard(
            shopName: "MacDonald's",
            title: "Burger & Beer",
            svgSrc: "assets/icons/burger_beer.svg",
            press: () {},
          ),
          ItemCard(
            shopName: "Wendys",
            title: "Chinese & Noodless",
            svgSrc: "assets/icons/chinese_noodles.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
