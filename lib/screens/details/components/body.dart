import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/details/components/image_item.dart';

import 'title_price_rating.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  const <Widget>[
        ImageItem(srcImg: "assets/images/burger.png"),
        Expanded(
          child: TitlePriceRating(
            name: "Cheese Burger",
            numOfReviews: 24,
            price: 15.0,
            rating: 4,
          ),
        ),
      ],
    );
  }
}
