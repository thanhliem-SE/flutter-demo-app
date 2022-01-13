import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constants.dart';

class ItemCart extends StatelessWidget {
  final String shopName, title, svgSrc;
  final VoidCallback? press;
  const ItemCart({
    Key? key,
    required this.shopName,
    required this.title,
    required this.svgSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 15, bottom: 20, top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: const Color(0xFFB0CCE1).withOpacity(0.32),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.13),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  svgSrc,
                  width: size.width * 0.18,
                ),
              ),
              Text(title),
              const SizedBox(height: 10),
              Text(
                shopName,
                style: const TextStyle(fontSize: 12),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
