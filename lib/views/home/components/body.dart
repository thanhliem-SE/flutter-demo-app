import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/combo_meal.dart';
import 'package:food_ordering_app/views/components/search_box.dart';
import 'package:food_ordering_app/views/details/detail_screen.dart';
import 'package:food_ordering_app/views/home/components/category_list.dart';
import 'package:food_ordering_app/views/home/components/discount_card.dart';
import 'package:food_ordering_app/views/home/components/cb_meal_card.dart';
import 'package:food_ordering_app/views/home/components/cb_meal_card_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchBox(onChanged: (value) {}),
          const CategoryList(),
          ComboMealCardList(
            items: initItemCardList(context),
          ),
          const DiscountCard(),
        ],
      ),
    );
  }

  List<Widget> initItemCardList(BuildContext context) {
    List<Widget> items = [];
    // items.add(ItemCard(item: Item(title: "", shopName: "", svgSrc: "", press:  toDetailScreen)));
    ComboMealCard itemCard1 = ComboMealCard(
        item: ComboMeal(
            title: "Burger & Beer",
            shopName: "MacDonald",
            svgSrc: "assets/icons/burger_beer.svg"));
    items.add(itemCard1);

    ComboMealCard itemCard2 = ComboMealCard(
        item: ComboMeal(
            title: "Chinese & Noodless",
            shopName: "MacDonald",
            svgSrc: "assets/icons/chinese_noodles.svg"));
    items.add(itemCard2);

    ComboMealCard itemCard3 = ComboMealCard(
        item: ComboMeal(
            title: "Burger & Beer",
            shopName: "MacDonald",
            svgSrc: "assets/icons/burger_beer.svg"));
    items.add(itemCard3);

    ComboMealCard itemCard4 = ComboMealCard(
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
