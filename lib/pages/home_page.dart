import 'package:book_inn_air/cubit/auth_cubit.dart';
import 'package:book_inn_air/cubit/destination_cubit.dart';
import 'package:book_inn_air/models/destination_model.dart';
import 'package:book_inn_air/pages/widgets/destination_card.dart';
import 'package:book_inn_air/pages/widgets/destination_tile.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestination();
    super.initState();
  }

  Future refresh() async {
    context.read<DestinationCubit>().fetchDestination();
  }

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.user.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Where to fly today?',
                        style: grayTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/img_profilePic.png'),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget _popularDestination(List<DestinationModel> destinations) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: destinations.map((DestinationModel destination) {
            return DestinationCard(destination);
          }).toList(),
        ),
      );
    }

    Widget _newDestination(List<DestinationModel> destinations) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New This Year',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: destinations.map((DestinationModel destination) {
              return DestinationTile(destination);
            }).toList(),
          )
        ],
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return SafeArea(
            child: RefreshIndicator(
              onRefresh: refresh,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: defaultMargin + 6,
                  ),
                  child: Column(
                    children: [
                      _header(),
                      const SizedBox(height: 30),
                      _popularDestination(state.destinations),
                      const SizedBox(height: 30),
                      _newDestination(state.destinations),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
