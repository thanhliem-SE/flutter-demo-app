import 'package:flutter/material.dart';
import 'package:food_ordering_app/components/search_box.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(onChanged: (value) {}),
      ],
    );
  }
}
