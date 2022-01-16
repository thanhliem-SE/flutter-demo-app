import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/combo_meal.dart';
import 'package:food_ordering_app/views/components/search_box.dart';
import 'package:food_ordering_app/views/details/detail_screen.dart';
import 'package:food_ordering_app/views/home/components/category_list.dart';
import 'package:food_ordering_app/views/home/components/discount_card.dart';
import 'package:food_ordering_app/views/home/components/item_card.dart';
import 'package:food_ordering_app/views/home/components/item_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchBox(onChanged: (value) {}),
            const CategoryList(),
            ItemList(
              items: initItemCardList(context),
            ),
            const DiscountCard(),
          ],
        ),
      ),
    );
  }

  List<Widget> initItemCardList(BuildContext context) {
    List<Widget> items = [];
    // items.add(ItemCard(item: Item(title: "", shopName: "", svgSrc: "", press:  toDetailScreen)));
    ItemCard itemCard1 = ItemCard(
        item: ComboMeal(
            title: "Burger & Beer",
            shopName: "MacDonald",
            svgSrc: "assets/icons/burger_beer.svg"));
    items.add(itemCard1);

    ItemCard itemCard2 = ItemCard(
        item: ComboMeal(
            title: "Chinese & Noodless",
            shopName: "MacDonald",
            svgSrc: "assets/icons/chinese_noodles.svg"));
    items.add(itemCard2);

    ItemCard itemCard3 = ItemCard(
        item: ComboMeal(
            title: "Burger & Beer",
            shopName: "MacDonald",
            svgSrc: "assets/icons/burger_beer.svg"));
    items.add(itemCard3);

    ItemCard itemCard4 = ItemCard(
        item: ComboMeal(
            title: "Chinese & Noodless",
            shopName: "MacDonald",
            svgSrc: "assets/icons/chinese_noodles.svg"));
    items.add(itemCard4);

    return items;
  }

  void toDetailScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const DetailScreen();
    }));
  }
}
