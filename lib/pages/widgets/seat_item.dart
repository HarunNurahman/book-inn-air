import 'package:book_inn_air/cubit/seat_cubit.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  // NOTE: Status
  // 0 = available
  // 1 = selected
  // 2 = unavailable
  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.read<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return primaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        return primaryColor;
      }
    }

    textSelected() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(defaultRadius - 2),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: textSelected(),
      ),
    );
  }
}
