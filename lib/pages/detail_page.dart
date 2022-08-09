import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget for background / thumbnail image
    Widget _backgroundImage() {
      // Shadow for background image
      Widget _bottomShadowContent() {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 215,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kWhiteColor.withOpacity(0),
                  Colors.black.withOpacity(0.95),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 75,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lake Ciliwung',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: semiBold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  'Tangerang, Jawa Barat',
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }

      Widget _emblem() {
        return Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          child: Column(
            children: [
              // Top emblem
              Center(
                child: Image.asset(
                  'assets/icons/ic_emblem.png',
                  width: 108,
                ),
              ),
            ],
          ),
        );
      }

      // Content for background image
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/img_destination-1.png'),
          ),
        ),
        child: Stack(
          children: [
            _emblem(),
            _bottomShadowContent(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            _backgroundImage(),
          ],
        ),
      ),
    );
  }
}
