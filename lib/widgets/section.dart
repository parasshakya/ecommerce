import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Section extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  Section(
      {required this.title, required this.subtitle, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 18.w, right: 14.w, bottom: 22.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 34.sp),
                    ),
                    Text(
                      subtitle,
                      style:
                          TextStyle(fontSize: 11.sp, color: Colors.grey.shade200),
                    )
                  ],
                ),
                Text(
                  'View all',
                  style: TextStyle(fontSize: 11.sp),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
