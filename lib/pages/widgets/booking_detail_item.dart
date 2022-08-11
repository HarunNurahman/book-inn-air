import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class BookingDetailItem extends StatelessWidget {
  final String name;
  final String value;
  final Color color;

  const BookingDetailItem({
    Key? key,
    required this.name,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultMargin - 8),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/ic_checklist.png',
            width: 16,
          ),
          const SizedBox(width: 6),
          Text(
            name,
            style: blackTextStyle,
          ),
          const Spacer(),
          Text(
            value,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
