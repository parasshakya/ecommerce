import 'package:ecommerce/providers/brand_provider.dart';
import 'package:ecommerce/widgets/brand_container.dart';
import 'package:ecommerce/widgets/colors_container.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/filterPageBottomContainer.dart';
import 'package:ecommerce/widgets/size_container.dart';
import 'package:ecommerce/widgets/sub_category_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  RangeValues _values = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {


    RangeLabels _rangeLabels =
        RangeLabels(_values.start.toString(), _values.end.toString());

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(
          appBarTitle: 'Filters',
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        preferredSize: Size(375.w, 44.h),
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 14.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text('Price range'),
              ),
              SizedBox(
                height: 12.h,
              ),
              Card(
                margin: const EdgeInsets.all(0),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$43'),
                          Text('\$768'),
                        ],
                      ),
                      RangeSlider(
                        values: _values,
                        onChanged: (newValues) {
                          setState(() {
                            _values = newValues;
                          });
                        },
                        min: 0,
                        max: 100,
                        divisions: 10,
                        labels: _rangeLabels,
                        activeColor: Colors.red.shade800,
                        inactiveColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 14.h, bottom: 12.h),
                child: Text("Colors"),
              ),
             ColorsContainer(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 14.h, bottom: 12.h),
                child: Text("Sizes"),
              ),
             SizeContainer(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 14.h, bottom: 12.h),
                child: Text("Sub-Category"),
              ),
              SubCategoryContainer(),


              BrandContainer(),
              SizedBox(
                height: 120.h,
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: FilterPageBottomContainer()
          )
        ],
      ),
    );
  }
}
