import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/home/components/item_cart.dart';

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
          ItemCart(
            shopName: "MacDonald's",
            title: "Burger & Beer",
            svgSrc: "assets/icons/burger_beer.svg",
            press: () {},
          ),
          ItemCart(
            shopName: "Wendys",
            title: "Chinese & Noodless",
            svgSrc: "assets/icons/chinese_noodles.svg",
            press: () {},
          ),
          ItemCart(
            shopName: "MacDonald's",
            title: "Burger & Beer",
            svgSrc: "assets/icons/burger_beer.svg",
            press: () {},
          ),
          ItemCart(
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
