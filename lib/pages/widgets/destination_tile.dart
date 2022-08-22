import 'package:book_inn_air/models/destination_model.dart';
import 'package:book_inn_air/pages/detail_page.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destinations;

  const DestinationTile(
    this.destinations, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            // Image thumbnail
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    destinations.imageUrl,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Destination and location
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinations.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    destinations.location,
                    style: grayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            // Rating destination
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
                  destinations.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
