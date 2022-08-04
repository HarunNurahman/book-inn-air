import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                _inputSection(),
                _tncButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      'Join us and get\nyour next journey',
      style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
    );
  }

  Widget _tncButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        'Terms and Conditions',
        style: grayTextStyle.copyWith(
          fontSize: 16,
          fontWeight: light,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _inputSection() {
    // Fullname textformfield
    Widget nameInput() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                hintText: 'Your Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    // Email textformfield
    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                hintText: 'Your Email Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    // Password textformfield
    Widget passInput() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              obscureText: true,
              cursorColor: primaryColor,
              decoration: InputDecoration(
                hintText: 'Your Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    // Hobby textformfield
    Widget hobbyInput() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hobby',
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                hintText: 'Your Hobby',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    // Sign up button
    Widget submitButton() {
      return Container(
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
            ),
            child: Text(
              'Get Started',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Column(
        children: [
          nameInput(),
          emailInput(),
          passInput(),
          hobbyInput(),
          submitButton(),
        ],
      ),
    );
  }
}
