import 'package:book_inn_air/cubit/destination_cubit.dart';
import 'package:book_inn_air/models/destination_model.dart';
import 'package:book_inn_air/pages/choose_seat_page.dart';
import 'package:book_inn_air/pages/widgets/custom_button.dart';
import 'package:book_inn_air/pages/widgets/detail_picture_item.dart';
import 'package:book_inn_air/pages/widgets/interest_item.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final DestinationModel _destinationModel;

  const DetailPage(this._destinationModel, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
    Widget _backgroundImage() {
      Widget _dropShadow() {
        return Container(
          margin: const EdgeInsets.only(top: 150),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kWhiteColor.withOpacity(0.0),
                Colors.black.withOpacity(0.9),
              ],
            ),
          ),
        );
      }

      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.55,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              widget._destinationModel.imageUrl,
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
                top: MediaQuery.of(context).size.height * 0.28,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Destination name
                        Text(
                          widget._destinationModel.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        // Location
                        Text(
                          widget._destinationModel.location,
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
                        widget._destinationModel.rating.toString(),
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
                    widget._destinationModel.about,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      height: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Destination detail picture
                  Text(
                    'Photos',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        PhotoItem(
                          imgUrl: 'assets/images/img_detailPic-1.png',
                        ),
                        PhotoItem(
                          imgUrl: 'assets/images/img_detailPic-2.png',
                        ),
                        PhotoItem(
                          imgUrl: 'assets/images/img_detailPic-3.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Destination interest
                  Text(
                    'Interests',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      InterestItem(
                        title: widget._destinationModel.interest[0].toString(),
                      ),
                      InterestItem(
                        title: widget._destinationModel.interest[1].toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InterestItem(
                        title: widget._destinationModel.interest[2].toString(),
                      ),
                      InterestItem(
                        title: widget._destinationModel.interest[3].toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Book price and button
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin + 6),
              child: Row(
                children: [
                  // Price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(widget._destinationModel.price),
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'per orang',
                          style: grayTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ],
                    ),
                  ),

                  // Book button
                  CustomButton(
                    title: 'Book Now',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseSeatPage(
                            widget._destinationModel,
                          ),
                        ),
                      );
                    },
                    width: 170,
                  )
                ],
              ),
            )
          ],
        ),
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
          return Scaffold(
            backgroundColor: bgColor,
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: refresh,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      _backgroundImage(),
                      _mainContent(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: bgColor,
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
