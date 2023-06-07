import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/widgets/filter.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/product.dart';
import '../widgets/custom_button.dart';
import 'filter_page.dart';

class CatalogPage extends StatefulWidget {
  final String category;

  CatalogPage({required this.category});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<String> sortTextList = [
    'Popular',
    'Newest',
    'Customer Review',
    'Price: Lowest to high',
    'Price: Highest to low'
  ];
  int selectedTileIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        bottom: PreferredSize(
          preferredSize: Size(375.w, 90.h),
          child: Container(
            height: 90.h,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: FutureBuilder<List<String>>(
                      future: ProductProvider.getAllCategoriesFromProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot!.data;

                          return ListView.builder(
                            itemCount: data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(left: 7.w),
                              child: CustomButton(
                                buttonText: data![index],
                                buttonHeight: 30.h,
                                buttonWidth: 100.w,
                                onPressed: () {},
                                backgroundColor: Colors.black,
                                padding: EdgeInsets.all(10.sp),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Something went wrong'),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  color: Colors.grey.shade200,
                  width: 343.w,
                  height: 24.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage()));
                        },
                        child: SizedBox(
                          height: 24.h,
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_list,
                                size: 24.sp,
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                'Filters',
                                style: TextStyle(fontSize: 11.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            context: context,
                            builder: (context) => Container(
                              height: 400.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 36.h,
                                  ),
                                  Text('Sort by'),
                                  SizedBox(
                                    height: 33.h,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        buildListTile(
                                            sortTextList[index], index),
                                    itemCount: sortTextList.length,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 24.h,
                          child: Row(
                            children: [
                              Icon(Icons.compare_arrows, size: 24.sp),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                selectedTileIndex == -1
                                    ? 'sort'
                                    : sortTextList[selectedTileIndex],
                                style: TextStyle(fontSize: 11.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.view_list,
                        size: 24.sp,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Product>>(
            future: ProductProvider.getProductsFromCategory(widget.category),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot!.data;

                if(selectedTileIndex == 0){
                  data!.sort((a, b) => b.rating.compareTo(a.rating),);

                }

                if(selectedTileIndex == 1){
                  data!.sort((a, b) => b.id.compareTo(a.id),);
                }

                if(selectedTileIndex == 2){
                  data!.sort((a, b) => b.reviews.length.compareTo(a.reviews.length),);
                }

                if(selectedTileIndex == 3){
                  if(data!.every((element) => element.discount == 0
                  )){
                    data!.sort((a, b) => a.price.compareTo(b.price),);
                  }else if(data!.every((element) => element.discount != 0)){
                    data!.sort((a,b) {
                      double priceAfterDiscountOfA = (a.price - a.discount).toDouble();
                      double priceAfterDiscountOfB = (b.price - b.discount).toDouble();
                     return priceAfterDiscountOfA.compareTo(priceAfterDiscountOfB);

                    });
                  }
                }
                if(selectedTileIndex == 4){
                  if(data!.every((element) => element.discount == 0
                  )){
                    data!.sort((a, b) => b.price.compareTo(a.price),);
                  }else if(data!.every((element) => element.discount != 0)){
                    data!.sort((a,b) {
                      double priceAfterDiscountOfA = (a.price - a.discount).toDouble();
                      double priceAfterDiscountOfB = (b.price - b.discount).toDouble();
                      return priceAfterDiscountOfB.compareTo(priceAfterDiscountOfA);

                    });
                  }
                }
                return Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 1.w,
                        mainAxisExtent: 260.h),
                    itemBuilder: (context, index) {
                       return ProductCard(product: data![index]); },
                    itemCount: data!.length,
                  ),
                );
              } else if (snapshot.hasError) {
                return  Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
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
              color: selectedTileIndex == index ? Colors.white : Colors.black),
        ),
        onTap: () {
          setState(() {
            selectedTileIndex = index;
          });
          Navigator.pop(context);
        },
      ),
    );
  }
}
