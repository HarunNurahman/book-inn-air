import 'package:book_inn_air/cubit/seat_cubit.dart';
import 'package:book_inn_air/models/destination_model.dart';
import 'package:book_inn_air/models/transaction_model.dart';
import 'package:book_inn_air/pages/checkout_page.dart';
import 'package:book_inn_air/pages/widgets/custom_button.dart';
import 'package:book_inn_air/pages/widgets/seat_item.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel _destinationModel;

  const ChooseSeatPage(this._destinationModel, {Key? key}) : super(key: key);

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
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // A
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // B column
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // blank space
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '',
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // C column
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // D column
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Seat number A1 - D1
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // A1
                      const SeatItem(
                        id: 'A1',
                      ),
                      // B1
                      const SeatItem(
                        id: 'B1',
                      ),
                      // Blank space
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: kTransparentColor,
                          borderRadius:
                              BorderRadius.circular(defaultRadius - 2),
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: grayTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // C1
                      const SeatItem(
                        id: 'C1',
                      ),
                      // D1
                      const SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),

                // Seat number A2 - D2
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // A2
                      const SeatItem(
                        id: 'A2',
                      ),
                      // B2
                      const SeatItem(
                        id: 'B2',
                      ),
                      // Blank space
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: kTransparentColor,
                          borderRadius:
                              BorderRadius.circular(defaultRadius - 2),
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: grayTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // C2
                      const SeatItem(
                        id: 'C2',
                      ),
                      // D2
                      const SeatItem(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),

                // Seat number A3 - D3
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // A3
                      const SeatItem(
                        id: 'A3',
                      ),
                      // B3
                      const SeatItem(
                        id: 'B3',
                      ),
                      // Blank space
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: kTransparentColor,
                          borderRadius:
                              BorderRadius.circular(defaultRadius - 2),
                        ),
                        child: Center(
                          child: Text(
                            '3',
                            style: grayTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // C3
                      const SeatItem(
                        id: 'C3',
                      ),
                      // D3
                      const SeatItem(
                        id: 'D3',
                      )
                    ],
                  ),
                ),

                // Seat number A4 - D4
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // A4
                      const SeatItem(
                        id: 'A4',
                      ),
                      // B4
                      const SeatItem(
                        id: 'B4',
                      ),
                      // Blank space
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: kTransparentColor,
                          borderRadius:
                              BorderRadius.circular(defaultRadius - 2),
                        ),
                        child: Center(
                          child: Text(
                            '4',
                            style: grayTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // C4
                      const SeatItem(
                        id: 'C4',
                      ),
                      // D4
                      const SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),

                // Seat number A5 - D5
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // A5
                      const SeatItem(
                        id: 'A5',
                      ),
                      // B5
                      const SeatItem(
                        id: 'B5',
                      ),
                      // Blank space
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: kTransparentColor,
                          borderRadius:
                              BorderRadius.circular(defaultRadius - 2),
                        ),
                        child: Center(
                          child: Text(
                            '5',
                            style: grayTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // C5
                      const SeatItem(
                        id: 'C5',
                      ),
                      // D5
                      const SeatItem(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),

                // Your selected seat(s)
                Padding(
                  padding: EdgeInsets.only(top: defaultMargin + 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat(s)',
                        style: grayTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ),

                // Total price
                Padding(
                  padding: EdgeInsets.only(top: defaultMargin - 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: grayTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(
                          state.length * _destinationModel.price!,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    Widget _checkoutButton() {
      return Padding(
        padding: EdgeInsets.only(top: defaultMargin + 6),
        child: BlocBuilder<SeatCubit, List<String>>(
          builder: (context, state) {
            return CustomButton(
              title: 'Continue to Checkout',
              onPressed: () {
                int price = _destinationModel.price! * state.length;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      TransactionModel(
                        destination: _destinationModel,
                        amountOfPeople: state.length,
                        selectedSeats: state.join(', '),
                        insurance: true,
                        refundable: false,
                        vat: 0.45,
                        price: price,
                        grandTotal: price + (price * 0.45).toInt(),
                      ),
                    ),
                  ),
                );
              },
              width: double.infinity,
            );
          },
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
              _checkoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
