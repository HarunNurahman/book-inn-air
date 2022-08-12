import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String title;

  const InterestItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Image.asset(
            'assets/icons/ic_checklist.png',
            width: 16,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 6),
          Text(
            title,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
