import 'package:book_inn_air/cubit/page_cubit.dart';
import 'package:book_inn_air/pages/home_page.dart';
import 'package:book_inn_air/pages/setting_page.dart';
import 'package:book_inn_air/pages/transaction_page.dart';
import 'package:book_inn_air/pages/wallet_page.dart';
import 'package:book_inn_air/pages/widgets/custom_bottom_navigation_item.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

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
                index: 0,
              ),
              // Book button
              CustomBottomNavItem(
                imgUrl: 'assets/icons/ic_booked.png',
                index: 1,
              ),
              // Payment button
              CustomBottomNavItem(
                imgUrl: 'assets/icons/ic_payment.png',
                index: 2,
              ),
              // Settings button
              CustomBottomNavItem(
                imgUrl: 'assets/icons/ic_settings.png',
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: bgColor,
          body: Stack(
            children: [
              _buildContent(currentIndex),
              _customBottomNavBar(),
            ],
          ),
        );
      },
    );
  }
}
