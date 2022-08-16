import 'package:book_inn_air/cubit/auth_cubit.dart';
import 'package:book_inn_air/pages/widgets/custom_button.dart';
import 'package:book_inn_air/pages/widgets/custom_text_form_field.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _hobbyController = TextEditingController();

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
      return GestureDetector(
        onTap: () {},
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Terms and Conditions',
            style: grayTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    Widget _inputSection() {
      // Fullname textformfield
      Widget nameInput() {
        return CustomTextFormField(
          title: 'Full Name',
          hintText: 'Enter your full name',
          controller: _nameController,
        );
      }

      // Email textformfield
      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email',
          hintText: 'Enter your email',
          controller: _emailController,
        );
      }

      // Password textformfield
      Widget passInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Enter your password',
          obsecureText: true,
          controller: _passController,
        );
      }

      // Hobby textformfield
      Widget hobbyInput() {
        return CustomTextFormField(
          title: 'Hobby',
          hintText: 'Enter your hobby',
          controller: _hobbyController,
        );
      }

      // Signup button
      Widget signUpButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/bonus',
                (route) => false,
              );
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              title: 'Get Started',
              onPressed: (() {
                print(_passController.text);
                context.read<AuthCubit>().signUp(
                      email: _emailController.text,
                      pass: _passController.text,
                      name: _nameController.text,
                      hobby: _hobbyController.text,
                    );
              }),
            );
          },
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
            signUpButton(),
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
