import 'package:flutter/material.dart';
import 'package:food_ordering_app/views/components/bottom_nav_bar.dart';
import 'package:food_ordering_app/views/home/components/app_bar.dart';
import 'package:food_ordering_app/views/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: const BottomNavBar(),
      body: const Body(),
    );
  }
}
