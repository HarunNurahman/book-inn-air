import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class CustomBottomNavItem extends StatelessWidget {
  final String imgUrl;
  final bool isSelected;

  const CustomBottomNavItem({
    Key? key,
    required this.imgUrl,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Image.asset(
          imgUrl,
          width: 24,
        ),
        // Line below icon / activated state
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : kTransparentColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        )
      ],
    );
  }
}
