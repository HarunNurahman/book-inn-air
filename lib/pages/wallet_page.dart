import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Wallet Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
