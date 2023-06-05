import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EcommerceThemes {
  static final authPageAppBarTheme = AppBarTheme(
      backgroundColor: Colors.grey.shade200,
      elevation: 0,
      titleTextStyle: GoogleFonts.metrophobic(
        color: Colors.black,
        fontSize: 34.sp,
        fontWeight: FontWeight.bold,
      ));

  static final ecomTheme = TextTheme(
      bodyMedium: GoogleFonts.metrophobic(
    fontSize: 20.sp,
        fontWeight: FontWeight.w600
  ),
  titleMedium: GoogleFonts.metrophobic(
      fontSize: 16.sp
  )
  );


}
