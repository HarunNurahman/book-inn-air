import 'package:book_inn_air/pages/widgets/booking_detail_item.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Destination route
    Widget _imgRoute() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin - 4,
        ),
        child: Column(
          children: [
            // Header Image
            Image.asset(
              'assets/images/img_checkout.png',
              width: 290,
            ),
            // Destination where the flight will be going to
            Padding(
              padding: EdgeInsets.only(top: defaultMargin - 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Departure
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CGK',
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Tangerang',
                        style: grayTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      )
                    ],
                  ),
                  // Destination
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'TLC',
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Ciliwung',
                        style: grayTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    // Detail booking
    Widget _bookingDetail() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin + 6),
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin + 6,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Destination tile
            Row(
              children: [
                // Image thumbnail
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/img_destination-1.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Destination and location
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lake Ciliwung',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Tangerang',
                        style: grayTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                // Rating destination
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: kYellowColor,
                      size: 24,
                    ),
                    Text(
                      '4.8',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ],
            ),
            // Booking detail(s)
            Padding(
              padding: EdgeInsets.only(top: defaultMargin - 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking Details',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),

                  // Booking Detail Items - Travelere count
                  BookingDetailItem(
                    name: 'Traveler',
                    value: '2 Person(s)',
                    color: kPurpleColor,
                  ),
                  // Booking Detail Items - Requested seat
                  BookingDetailItem(
                    name: 'Seat',
                    value: 'A3, B3',
                    color: kPurpleColor,
                  ),
                  // Booking Detail Items - Insurance
                  BookingDetailItem(
                    name: 'Insurance',
                    value: 'Yes'.toUpperCase(),
                    color: kGreenColor,
                  ),
                  // Booking Detail Items - Refundable
                  BookingDetailItem(
                    name: 'Refundable',
                    value: 'no'.toUpperCase(),
                    color: kRedColor,
                  ),
                  // Booking Detail Items - VAT
                  BookingDetailItem(
                    name: 'VAT',
                    value: '45%',
                    color: kPurpleColor,
                  ),
                  // Booking Detail Items - Subtotal
                  BookingDetailItem(
                    name: 'Subtotal',
                    value: 'IDR 1.000.000',
                    color: kPurpleColor,
                  ),
                  // Booking Detail Items - Total
                  BookingDetailItem(
                    name: 'Total',
                    value: 'IDR 1.450.000',
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _paymentDetail() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: defaultMargin + 6),
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin - 4,
          vertical: defaultMargin + 6,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: defaultMargin - 8),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          child: Image.asset(
                            'assets/images/img_card.png',
                            width: 100,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/app_logo.png',
                                width: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Pay',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: defaultMargin + 6,
                horizontal: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imgRoute(),
                  _bookingDetail(),
                  _paymentDetail(),
                ],
              ),
            ),
          ),
        ));
  }
}
