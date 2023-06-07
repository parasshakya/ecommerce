import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/brand_page.dart';

class BrandContainer extends StatelessWidget {
  const BrandContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BrandPage()));
      },
      child: Container(
        height: 58.h,
        width: 375.w,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Brand'),
                  Text('adidas Originals, Jack & Jones, s.Oliver', style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey
                  ),),
                ],
              ),
              Icon(Icons.arrow_forward_ios_sharp, size: 24.sp,),
            ],
          ),
        ),
      ),
    );
  }
}
