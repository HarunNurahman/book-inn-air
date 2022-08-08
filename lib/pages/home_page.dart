import 'package:book_inn_air/pages/widgets/destination_card.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy,\nKezia Anne',
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
            backgroundImage: AssetImage('assets/images/img_profilePic.png'),
          ),
        ],
      );
    }

    Widget _popularDestination() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            DestinationCard(
              imgUrl: 'assets/images/img_destination-1.png',
              name: 'Lake Ciliwung',
              location: 'Tangerang, Indonesia',
              rating: 4.8,
            ),
            DestinationCard(
              imgUrl: 'assets/images/img_destination-2.png',
              name: 'White Houses',
              location: 'Real Madrid, Spain',
              rating: 4.7,
            ),
            DestinationCard(
              imgUrl: 'assets/images/img_destination-3.png',
              name: 'Hill Heyo',
              location: 'Monte-Carlo, Monaco',
              rating: 4.8,
            ),
            DestinationCard(
              imgUrl: 'assets/images/img_destination-4.png',
              name: 'Takeshi Castle',
              location: 'Osaka, Japan',
              rating: 5.0,
            ),
            DestinationCard(
              imgUrl: 'assets/images/img_destination-5.png',
              name: 'The Big Umbrella',
              location: 'Singapore',
              rating: 4.8,
            ),
          ],
        ),
      );
    }

    return SafeArea(
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
              _popularDestination(),
            ],
          ),
        ),
      ),
    );
  }
}
