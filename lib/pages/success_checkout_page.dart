import 'package:book_inn_air/cubit/page_cubit.dart';
import 'package:book_inn_air/pages/widgets/custom_button.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img_success.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Text(
                    'Well Booked 😍',
                    style: blackTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Are you ready to explore the new\nworld of experiences?',
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            CustomButton(
              title: 'My Booking(s)',
              onPressed: () {
                context.read<PageCubit>().setPages(1);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/dashboard',
                  (route) => false,
                );
              },
              width: 220,
            )
          ],
        ),
      ),
    );
  }
}
