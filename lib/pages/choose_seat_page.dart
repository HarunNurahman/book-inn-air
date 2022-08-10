import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Title / headline
    Widget _title() {
      return Text(
        'Select Your\nFavorite Seat',
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
      );
    }

    Widget _seatStatus() {
      return Padding(
        padding: EdgeInsets.only(top: defaultMargin + 6),
        child: Row(
          children: [
            // Avaliable seat
            Image.asset(
              'assets/icons/ic_available.png',
              width: 16,
            ),
            const SizedBox(width: 6),
            Text(
              'Available',
              style: blackTextStyle,
            ),
            const SizedBox(width: 10),
            // Selected seat
            Image.asset(
              'assets/icons/ic_selected.png',
              width: 16,
            ),
            const SizedBox(width: 6),
            Text(
              'Selected',
              style: blackTextStyle,
            ),
            const SizedBox(width: 10),
            // Unavaliable seat
            Image.asset(
              'assets/icons/ic_unavailable.png',
              width: 16,
            ),
            const SizedBox(width: 6),
            Text(
              'Unavailable',
              style: blackTextStyle,
            )
          ],
        ),
      );
    }

    Widget _selectSeat() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: defaultMargin + 6),
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin - 2,
          vertical: defaultMargin + 6,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            // Seat letter
            Row(
              children: [
                // A
                Expanded(
                  child: Center(
                    child: Text(
                      'A',
                      style: grayTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: defaultMargin + 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              _seatStatus(),
              _selectSeat(),
            ],
          ),
        ),
      ),
    );
  }
}
