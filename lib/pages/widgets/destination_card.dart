import 'package:book_inn_air/models/destination_model.dart';
import 'package:book_inn_air/pages/detail_page.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel _destinationModel;

  const DestinationCard(
    this._destinationModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // White box for spacing
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(_destinationModel),
        ),
      ),
      child: Container(
        height: 325,
        width: 200,
        margin: EdgeInsets.only(right: defaultMargin),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        // Background image
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(
                    _destinationModel.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              // Rating destination
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  width: 55,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        defaultRadius,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: kYellowColor,
                        size: 20,
                      ),
                      Text(
                        _destinationModel.rating.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Destination name
                  Text(
                    _destinationModel.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Destination location
                  Text(
                    _destinationModel.location,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: grayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
