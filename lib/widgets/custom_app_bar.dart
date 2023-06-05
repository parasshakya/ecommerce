import 'package:ecommerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPageAppBar extends StatelessWidget {
  final String title;

  AuthPageAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    final authAppBarWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 140.h,
      width: authAppBarWidth,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon:  Icon(
              Icons.arrow_back_ios,
              size: 32.w,
            )),
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: EcommerceThemes.authPageAppBarTheme.titleTextStyle,
          ),
        )
      ]),
    );
  }
}


