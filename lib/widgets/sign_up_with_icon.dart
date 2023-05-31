import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpWithSocialContainer extends StatelessWidget {

  final String imageUrl;
  SignUpWithSocialContainer({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final signUpWithSocialContainerHeight = MediaQuery.of(context).size.height * 0.1;
    final signUpWithSocialContainerWidth = MediaQuery.of(context).size.width * 0.3;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      height: signUpWithSocialContainerHeight ,
      width: signUpWithSocialContainerWidth,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Image.network(imageUrl),
      ),
    );
  }
}
