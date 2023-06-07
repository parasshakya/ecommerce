import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {

  int selectedTileIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      width: 343.w,
      height: 24.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 24.h,
            child: Row(
              children: [
                Icon(Icons.filter_list, size: 24.sp,),
                SizedBox(width: 7.w,),
                Text('Filters', style: TextStyle(fontSize: 11.sp),)
              ],

            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
                  context: context, builder: (context) =>
                  Container(

                    height: 400.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        SizedBox(height: 36.h,),
                        Text('Sort by'),
                        SizedBox(height: 33.h,),
                        ListView(

                          shrinkWrap: true,
                          children: [
                            buildListTile('Popular', 0),
                            buildListTile('Newest', 1),
                            buildListTile('Customer Review', 2),
                            buildListTile('Price: Lowest to high', 3),
                            buildListTile('Price: Highest to low', 4),
                          ],
                        )

                      ],
                    ),
                  ),);
            },
            child: SizedBox(
              height: 24.h,
              child: Row(
                children: [
                  Icon(Icons.compare_arrows, size: 24.sp),
                  SizedBox(width: 7.w,),
                  Text(
                    'Price: lowest to high', style: TextStyle(fontSize: 11.sp),)
                ],


              ),


            ),
          ),
          Icon(Icons.view_list, size: 24.sp,)


        ],
      ),


    );
  }

  Widget buildListTile(String title, int index) {
    return Container(
      height: 48.h,
      color: selectedTileIndex == index ? Colors.red : Colors.white,
      child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: selectedTileIndex == index ? Colors.white : Colors.black
            ),

          ),
        onTap: (){
            setState(() {
              selectedTileIndex = index;
            });
        },

      ),
    );
  }
}
