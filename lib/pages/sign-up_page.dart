import 'package:book_inn_air/pages/widgets/custom_button.dart';
import 'package:book_inn_air/pages/widgets/custom_text_form_field.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Header
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
        return CustomTextFormField(
            title: 'Full Name', hintText: 'Enter your full name');
      }

      // Email textformfield
      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email',
          hintText: 'Enter your email',
        );
      }

      // Password textformfield
      Widget passInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Enter your password',
          obsecureText: true,
        );
      }

      // Hobby textformfield
      Widget hobbyInput() {
        return CustomTextFormField(
          title: 'Hobby',
          hintText: 'Enter your hobby',
        );
      }

      // Input section
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
            CustomButton(
              margin: const EdgeInsets.only(top: 30),
              title: 'Get Started',
              onPressed: (() {
                Navigator.pushNamed(context, '/bonus');
              }),
            ),
          ],
        ),
      );
    }

    // Main body
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
}
