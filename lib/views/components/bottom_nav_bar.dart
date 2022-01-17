import 'package:flutter/material.dart';
import 'package:food_ordering_app/until/constants.dart';
import 'package:food_ordering_app/views/home/home_screens.dart';
import 'package:food_ordering_app/views/manager/category_manage_screen.dart';
import 'package:food_ordering_app/views/personal/personal_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Personal',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kPrimaryColor,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    // print("==> Index: $index");
    Route routePerson =
        MaterialPageRoute(builder: (context) => const PersonalScreen());
    Route routeHome =
        MaterialPageRoute(builder: (context) => const HomeScreen());
    Route routeCategoryManage =
        MaterialPageRoute(builder: (context) => const CategoryManage());
    if (index == 0) {
      Navigator.canPop(context)
          ? Navigator.pop(context)
          : Navigator.push(context, routeHome);
    } else if (index == 1) {
      Navigator.canPop(context)
          ? Navigator.pop(context)
          : Navigator.push(context, routeCategoryManage);
    } else if (index == 2) {
      Navigator.canPop(context)
          ? Navigator.pop(context)
          : Navigator.push(context, routePerson);
    }
    setState(() {
      _selectedIndex = index;
    });
  }
}
