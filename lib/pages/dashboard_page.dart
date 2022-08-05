import 'package:book_inn_air/pages/widgets/custom_bottom_navigation_item.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BottomNavBar Widget
    Widget _customBottomNavBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              // Home button
              CustomBottomNavItem(
                imgUrl: 'assets/icons/ic_home.png',
                isSelected: true,
              ),
              // Book button
              CustomBottomNavItem(
                imgUrl: 'assets/icons/ic_booked.png',
              ),
              // Payment button
              CustomBottomNavItem(
                imgUrl: 'assets/icons/ic_payment.png',
              ),
              // Settings button
              CustomBottomNavItem(
                imgUrl: 'assets/icons/ic_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Center(
            child: Text('Dashboard'),
          ),
          _customBottomNavBar(),
        ],
      ),
    );
  }
}
