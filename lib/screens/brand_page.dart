import 'package:ecommerce/providers/category_provider.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/widgets/filterPageBottomContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/brand_provider.dart';
import '../widgets/brand_page_component.dart';

class BrandPage extends StatefulWidget {



  const BrandPage({Key? key}) : super(key: key);

  @override
  State<BrandPage> createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 21.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(23.r),
                            right: Radius.circular(23.r)),
                        borderSide: BorderSide(color: Colors.transparent)) ,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(23.r),
                            right: Radius.circular(23.r)),
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintText: 'Search',
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.search, size: 14.sp),
                    focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(23.r),
                            right: Radius.circular(23.r)),
                        borderSide: BorderSide(color: Colors.transparent)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Consumer<BrandProvider>(builder: (context, value, child) => ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => BrandPageContainer(index: index, brandName: value.brands[index]),
                itemCount: value.brands.length,
              ) ,)
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: FilterPageBottomContainer()),

        ],
      ),
    );
  }
}
