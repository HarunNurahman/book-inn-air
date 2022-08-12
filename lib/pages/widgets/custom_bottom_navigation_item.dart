import 'package:book_inn_air/cubit/page_cubit.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavItem extends StatelessWidget {
  final String imgUrl;
  final int index;

  const CustomBottomNavItem({
    Key? key,
    required this.imgUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<PageCubit>().setPages(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            imgUrl,
            width: 24,
            color: context.read<PageCubit>().state == index
                ? primaryColor
                : kGrayColor,
          ),
          // Line below icon / activated state
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? primaryColor
                  : kTransparentColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          )
        ],
      ),
    );
  }
}
