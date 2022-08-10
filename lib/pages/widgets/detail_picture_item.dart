import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String imgUrl;

  const PhotoItem({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            imgUrl,
          ),
        ),
      ),
    );
  }
}
