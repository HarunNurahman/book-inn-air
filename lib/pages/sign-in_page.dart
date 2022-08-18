import 'package:book_inn_air/cubit/auth_cubit.dart';
import 'package:book_inn_air/pages/widgets/custom_button.dart';
import 'package:book_inn_air/pages/widgets/custom_text_form_field.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Header
    Widget _title() {
      return Text(
        'Sign-in with your existing account',
        style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
      );
    }

    Widget _signUpButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Center(
          child: Text(
            'Don\'t have an account? Sign Up',
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

      // Signup button
      Widget signInButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/dashboard',
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
              title: 'Sign In',
              onPressed: (() {
                context.read<AuthCubit>().signIn(
                      email: _emailController.text,
                      pass: _passController.text,
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
            emailInput(),
            passInput(),
            signInButton(),
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
                _signUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
