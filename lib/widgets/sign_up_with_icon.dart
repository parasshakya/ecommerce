import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpWithSocialContainer extends StatelessWidget {

  final String imageUrl;
  SignUpWithSocialContainer({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      height: 64.h ,
      width: 92.w,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 34.w, vertical: 20.h),
        child: Image.network(imageUrl),
      ),
    );
  }
}
