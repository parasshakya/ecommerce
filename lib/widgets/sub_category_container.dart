import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryContainer extends StatefulWidget {
  const SubCategoryContainer({Key? key}) : super(key: key);

  @override
  State<SubCategoryContainer> createState() => _SubCategoryContainerState();
}

class _SubCategoryContainerState extends State<SubCategoryContainer> {
  bool isAllContainerSelected = false;
  bool isWomenContainerSelected = false;
  bool isMenContainerSelected = false;
  bool isBoysContainerSelected = false;
  bool isGirlsContainerSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 24.h, left: 16.w),
          child: Wrap(
            runSpacing: 12.h,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAllContainerSelected = true;
                    isWomenContainerSelected = false;
                    isMenContainerSelected = false;
                    isBoysContainerSelected = false;
                    isGirlsContainerSelected = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16.w),
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: isAllContainerSelected
                          ? Colors.red.shade800
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: isAllContainerSelected
                          ? null
                          : Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    'All',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: isAllContainerSelected
                            ? Colors.white
                            : Colors.black),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAllContainerSelected = false;
                    isWomenContainerSelected = true;
                    isMenContainerSelected = false;
                    isBoysContainerSelected = false;
                    isGirlsContainerSelected = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16.w),
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: isWomenContainerSelected
                          ? Colors.red.shade800
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: isWomenContainerSelected
                          ? null
                          : Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    'Women',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: isWomenContainerSelected
                            ? Colors.white
                            : Colors.black),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAllContainerSelected = false;
                    isWomenContainerSelected = false;
                    isMenContainerSelected = true;
                    isBoysContainerSelected = false;
                    isGirlsContainerSelected = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16.w),
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: isMenContainerSelected
                          ? Colors.red.shade800
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: isMenContainerSelected
                          ? null
                          : Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    'Men',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: isMenContainerSelected
                            ? Colors.white
                            : Colors.black),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAllContainerSelected = false;
                    isWomenContainerSelected = false;
                    isMenContainerSelected = false;
                    isBoysContainerSelected = true;
                    isGirlsContainerSelected = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16.w),
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: isBoysContainerSelected
                          ? Colors.red.shade800
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: isBoysContainerSelected
                          ? null
                          : Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    'Boys',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: isBoysContainerSelected
                            ? Colors.white
                            : Colors.black),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAllContainerSelected = false;
                    isWomenContainerSelected = false;
                    isMenContainerSelected = false;
                    isBoysContainerSelected = false;
                    isGirlsContainerSelected = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16.w),
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: isGirlsContainerSelected
                          ? Colors.red.shade800
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: isGirlsContainerSelected
                          ? null
                          : Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    'Girls',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: isGirlsContainerSelected
                            ? Colors.white
                            : Colors.black),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
