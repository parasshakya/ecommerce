import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EcommerceThemes {
  static final authPageAppBarTheme = AppBarTheme(
      backgroundColor: Colors.grey.shade200,
      elevation: 0,
      titleTextStyle: GoogleFonts.metrophobic(
        color: Colors.black,
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
      ));

  static final bodyText2Theme = TextTheme(
      bodyMedium: GoogleFonts.metrophobic(
    fontSize: 20.sp,
        fontWeight: FontWeight.w600
  ));
}
