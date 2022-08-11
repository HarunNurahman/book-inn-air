import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xFF5C40CC);
Color bgColor = const Color(0xFFFAFAFA);
Color kInactiveColor = const Color(0xFFDBD7EC);

Color kUnavailableColor = const Color(0xFFEBECF1);
Color kAvailableColor = const Color(0xFFE0D9FF);

Color kPurpleColor = const Color(0xFF1F1449);
Color kGrayColor = const Color(0xFF9698A9);
Color kWhiteColor = const Color(0xFFFFFFFF);
Color kGreenColor = const Color(0xFF0EC3AE);
Color kRedColor = const Color(0xFFEB70A5);
Color kYellowColor = const Color(0xFFFFA235);
Color kTransparentColor = Colors.transparent;

double defaultMargin = 24.0;
double defaultRadius = 17.0;

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kPurpleColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);

TextStyle grayTextStyle = GoogleFonts.poppins(
  color: kGrayColor,
);

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);

TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
