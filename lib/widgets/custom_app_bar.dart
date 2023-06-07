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

class MainAppBar extends StatelessWidget {

  final String? appBarTitle;
  final Icon? actionIcon;
  final Function()? onBackButtonPressed;
  final Function()? onActionIconPressed;


  MainAppBar({ this.onBackButtonPressed, this.actionIcon, this.appBarTitle, this.onActionIconPressed});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(appBarTitle ?? ''),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      centerTitle: true,
      elevation: 1,
      leading: IconButton(
        onPressed: onBackButtonPressed,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      actions: [
        actionIcon == null ? Text('') : IconButton(onPressed: onActionIconPressed, icon: actionIcon! )


      ],
    );
  }
}

