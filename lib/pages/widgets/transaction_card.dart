import 'package:book_inn_air/models/transaction_model.dart';
import 'package:book_inn_air/pages/widgets/booking_detail_item.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transactionModel;

  const TransactionCard(this.transactionModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      transactionModel.destination!.imageUrl!,
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
                      transactionModel.destination!.name!,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      transactionModel.destination!.location!,
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
                    transactionModel.destination!.rating.toString(),
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
                  value: '${transactionModel.amountOfPeople} Person(s)',
                  color: kPurpleColor,
                ),
                // Booking Detail Items - Requested seat
                BookingDetailItem(
                  name: 'Seat',
                  value: transactionModel.selectedSeats!,
                  color: kPurpleColor,
                ),
                // Booking Detail Items - Insurance
                BookingDetailItem(
                  name: 'Insurance',
                  value: transactionModel.insurance! ? 'YES' : 'NO',
                  color: transactionModel.insurance! ? kGreenColor : kRedColor,
                ),
                // Booking Detail Items - Refundable
                BookingDetailItem(
                  name: 'Refundable',
                  value: transactionModel.refundable! ? 'YES' : 'NO',
                  color: transactionModel.refundable! ? kGreenColor : kRedColor,
                ),
                // Booking Detail Items - VAT
                BookingDetailItem(
                  name: 'VAT',
                  value: '${(transactionModel.vat! * 100).toStringAsFixed(0)}%',
                  color: kPurpleColor,
                ),
                // Booking Detail Items - Subtotal
                BookingDetailItem(
                  name: 'Subtotal',
                  value: NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(transactionModel.price),
                  color: kPurpleColor,
                ),
                // Booking Detail Items - Total
                BookingDetailItem(
                  name: 'Total',
                  value: NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(transactionModel.grandTotal),
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
