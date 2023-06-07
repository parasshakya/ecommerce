import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FilterPageBottomContainer extends StatefulWidget {
  const FilterPageBottomContainer({Key? key}) : super(key: key);

  @override
  State<FilterPageBottomContainer> createState() => _FilterPageBottomContainerState();
}

class _FilterPageBottomContainerState extends State<FilterPageBottomContainer> {

  bool isFirstContainerSelected = false;
  bool isSecondContainerSelected = false;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 104.h,
      decoration:  BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w, top: 20.h, right: 16.w,  bottom: 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){

                setState(() {
                  isFirstContainerSelected = true;
                  isSecondContainerSelected = false;
                });

              },
              child: Container(
                width: 160.w,
                height: 36.h,
                decoration: BoxDecoration(
                    color: isFirstContainerSelected ? Colors.red.shade800 : Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    border: isFirstContainerSelected ? null : Border.all()),
                child: Center(child: Text('Discard', style: TextStyle(
                  color: isFirstContainerSelected ? Colors.white : Colors.black
                ),)),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  isSecondContainerSelected = true;
                  isFirstContainerSelected = false;
                });
              },
              child: Container(
                width: 160.w,
                height: 36.h,
                decoration: BoxDecoration(
                    color: isSecondContainerSelected ?  Colors.red.shade800 : Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    border: isSecondContainerSelected ? null : Border.all()),
                child: Center(child: Text('Apply', style: TextStyle(
                  color: isSecondContainerSelected ? Colors.white : Colors.black
                ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
