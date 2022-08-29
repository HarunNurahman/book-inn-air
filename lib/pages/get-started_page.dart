import 'package:book_inn_air/pages/widgets/custom_button.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget signUpButton() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 50,
        ),
        width: 220,
        height: 55,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kTransparentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              side: BorderSide(
                width: 1,
                color: kWhiteColor,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/sign-up');
          },
          child: Text(
            'Get Started',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              // Background image
              image: DecorationImage(
                image: AssetImage('assets/images/img_getStarted.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Title
                Text(
                  'Fly Like a Bird',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 10),
                // Subtitle
                Text(
                  'Explore new world with us and let\nyourself get an amazing experiences',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Get started button
                CustomButton(
                  title: 'Sign In',
                  margin: const EdgeInsets.only(
                    top: 50,
                    bottom: 30,
                  ),
                  width: 220,
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-in');
                  },
                ),
                signUpButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
