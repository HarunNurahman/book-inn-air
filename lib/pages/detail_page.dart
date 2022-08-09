import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _backgroundImage() {
      Widget _dropShadow() {
        return Container(
          margin: const EdgeInsets.only(top: 250),
          height: 215,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.9),
              ],
            ),
          ),
        );
      }

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
        child: Align(
          alignment: Alignment.bottomCenter,
          child: _dropShadow(),
        ),
      );
    }

    Widget _mainContent() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin + 6,
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            // Top emblem
            Center(
              child: Image.asset(
                'assets/icons/ic_emblem.png',
                width: 108,
              ),
            ),

            // Destination name, location, rating
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Destination name
                        Text(
                          'Lake Ciliwung',
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        // Location
                        Text(
                          'Ciliwung, Bali',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  // Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: kYellowColor,
                        size: 24,
                      ),
                      Text(
                        '4.5',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // About destination
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                vertical: defaultMargin + 6,
                horizontal: defaultMargin - 4,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      height: 2,
                    ),
                  )
                ],
              ),
            )
          ],
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
            _mainContent(),
          ],
        ),
      )),
    );
  }
}
