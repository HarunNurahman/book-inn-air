import 'package:book_inn_air/cubit/auth_cubit.dart';
import 'package:book_inn_air/cubit/transaction_cubit.dart';
import 'package:book_inn_air/models/transaction_model.dart';
import 'package:book_inn_air/pages/success_checkout_page.dart';
import 'package:book_inn_air/pages/widgets/booking_detail_item.dart';
import 'package:book_inn_air/pages/widgets/custom_button.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel _transactionModel;

  const CheckoutPage(this._transactionModel, {Key? key}) : super(key: key);

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
                        _transactionModel.destination.location,
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
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        _transactionModel.destination.imageUrl,
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
                        _transactionModel.destination.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _transactionModel.destination.location,
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
                      _transactionModel.destination.rating.toString(),
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
                    value: '${_transactionModel.amountOfPeople} Person(s)',
                    color: kPurpleColor,
                  ),
                  // Booking Detail Items - Requested seat
                  BookingDetailItem(
                    name: 'Seat',
                    value: _transactionModel.selectedSeats,
                    color: kPurpleColor,
                  ),
                  // Booking Detail Items - Insurance
                  BookingDetailItem(
                    name: 'Insurance',
                    value: _transactionModel.insurance ? 'YES' : 'NO',
                    color:
                        _transactionModel.insurance ? kGreenColor : kRedColor,
                  ),
                  // Booking Detail Items - Refundable
                  BookingDetailItem(
                    name: 'Refundable',
                    value: _transactionModel.refundable ? 'YES' : 'NO',
                    color:
                        _transactionModel.refundable ? kGreenColor : kRedColor,
                  ),
                  // Booking Detail Items - VAT
                  BookingDetailItem(
                    name: 'VAT',
                    value:
                        '${(_transactionModel.vat * 100).toStringAsFixed(0)}%',
                    color: kPurpleColor,
                  ),
                  // Booking Detail Items - Subtotal
                  BookingDetailItem(
                    name: 'Subtotal',
                    value: NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(_transactionModel.price),
                    color: kPurpleColor,
                  ),
                  // Booking Detail Items - Total
                  BookingDetailItem(
                    name: 'Total',
                    value: NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(_transactionModel.grandTotal),
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
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
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
                    padding: EdgeInsets.only(
                      top: defaultMargin - 8,
                    ),
                    child: Row(
                      children: [
                        // Icon selected payment method
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              child: Image.asset(
                                'assets/images/img_card.png',
                                width: 100,
                                fit: BoxFit.cover,
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
                        ),
                        const SizedBox(width: 16),
                        // Current balance
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                ).format(state.user.balance),
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Current Balance',
                                style: grayTextStyle.copyWith(
                                  fontWeight: light,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      );
    }

    Widget _payNowButton() {
      return Padding(
        padding: EdgeInsets.only(top: defaultMargin + 6),
        child: BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
            if (state is TransactionSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/success',
                (route) => false,
              );
            } else if (state is TransactionFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is TransactionLoading) {
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: defaultMargin + 6),
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return CustomButton(
              title: 'Pay Now',
              onPressed: () {
                context
                    .read<TransactionCubit>()
                    .createTransaction(_transactionModel);
              },
            );
          },
        ),
      );
    }

    Widget _tncButton() {
      return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.only(top: defaultMargin + 6),
          child: Center(
            child: Text(
              'Terms and Conditions',
              style: grayTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
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
                  _payNowButton(),
                  _tncButton(),
                ],
              ),
            ),
          ),
        ));
  }
}
