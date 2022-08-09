import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _backgroundImage() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.55,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/img_destination-1.png',
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            _backgroundImage(),
          ],
        ),
      )),
    );
  }
}
