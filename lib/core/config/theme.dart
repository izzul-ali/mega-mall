import 'package:ecommerce/core/config/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appThemeData(BuildContext contex) {
  return ThemeData(
    colorSchemeSeed: AppColor.primary,
    textTheme: GoogleFonts.dmSansTextTheme(),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme.of(contex).copyWith(backgroundColor: Colors.white),
  );
}
