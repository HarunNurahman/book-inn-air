import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Transaction Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
