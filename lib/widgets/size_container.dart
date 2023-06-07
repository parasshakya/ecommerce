import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeContainer extends StatefulWidget {
  const SizeContainer({Key? key}) : super(key: key);

  @override
  State<SizeContainer> createState() => _SizeContainerState();
}

class _SizeContainerState extends State<SizeContainer> {
  bool isXSContainerSelected = false;
  bool isSContainerSelected = false;
  bool isMContainerSelected = false;
  bool isLContainerSelected = false;
  bool isXLContainerSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isXSContainerSelected = true;
                  isSContainerSelected = false;
                  isMContainerSelected = false;
                  isLContainerSelected = false;
                  isXLContainerSelected = false;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: isXSContainerSelected
                        ? Colors.red.shade800
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: isXSContainerSelected
                        ? null
                        : Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  'XS',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color:
                          isXSContainerSelected ? Colors.white : Colors.black),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isXSContainerSelected = false;
                  isSContainerSelected = true;
                  isMContainerSelected = false;
                  isLContainerSelected = false;
                  isXLContainerSelected = false;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: isSContainerSelected
                        ? Colors.red.shade800
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: isSContainerSelected
                        ? null
                        : Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  'S',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color:
                          isSContainerSelected ? Colors.white : Colors.black),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isXSContainerSelected = false;
                  isSContainerSelected = false;
                  isMContainerSelected = true;
                  isLContainerSelected = false;
                  isXLContainerSelected = false;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: isMContainerSelected
                        ? Colors.red.shade800
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: isMContainerSelected
                        ? null
                        : Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  'M',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color:
                          isMContainerSelected ? Colors.white : Colors.black),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isXSContainerSelected = false;
                  isSContainerSelected = false;
                  isMContainerSelected = false;
                  isLContainerSelected = true;
                  isXLContainerSelected = false;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: isLContainerSelected
                        ? Colors.red.shade800
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: isLContainerSelected
                        ? null
                        : Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  'L',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color:
                          isLContainerSelected ? Colors.white : Colors.black),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isXSContainerSelected = false;
                  isSContainerSelected = false;
                  isMContainerSelected = false;
                  isLContainerSelected = false;
                  isXLContainerSelected = true;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: isXLContainerSelected
                        ? Colors.red.shade800
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: isXLContainerSelected
                        ? null
                        : Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  'XL',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color:
                          isXLContainerSelected ? Colors.white : Colors.black),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
