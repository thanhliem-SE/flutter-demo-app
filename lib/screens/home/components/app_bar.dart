import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app/constants.dart';

AppBar homeAppBar(BuildContext buildContext) {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      centerTitle: true,
      title: RichText(
        text: const TextSpan(
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(text: "Punk", style: TextStyle(color: ksecondaryColor)),
            TextSpan(text: "Food", style: TextStyle(color: kPrimaryColor)),
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/cons/notification.svg",
          ),
        ),
      ]);
}
