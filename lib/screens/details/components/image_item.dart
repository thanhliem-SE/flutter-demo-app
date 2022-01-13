import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key? key,
    required this.srcImg,
  }) : super(key: key);

  final String srcImg;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image.asset(
      srcImg,
      height: size.height * 0.25,
      width: double.infinity,
    );
  }
}
