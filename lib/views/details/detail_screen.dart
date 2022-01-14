import 'package:flutter/material.dart';
import 'package:food_ordering_app/until/constants.dart';
import 'package:food_ordering_app/views/details/components/body.dart';
import 'package:food_ordering_app/views/details/components/detail_app_bar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: const Body(),
    );
  }
}
