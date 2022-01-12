import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/home/components/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
    );
  }
}
