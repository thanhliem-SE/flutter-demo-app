import 'package:flutter/material.dart';
import 'package:food_ordering_app/until/constants.dart';
import 'package:food_ordering_app/views/home/home_screens.dart';
import 'package:food_ordering_app/views/manager/category_manage_screen.dart';
import 'package:food_ordering_app/views/personal/personal_screen.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({Key? key}) : super(key: key);

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoryManage(),
    PersonalScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
