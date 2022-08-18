import 'package:book_inn_air/cubit/auth_cubit.dart';
import 'package:book_inn_air/pages/widgets/custom_button.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.errorMessage),
            ),
          );
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/sign-up',
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: Center(
              child: CustomButton(
            title: 'Sign Out',
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            width: 220,
          )),
        );
      },
    );
  }
}
