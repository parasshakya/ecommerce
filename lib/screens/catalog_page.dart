import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/widgets/filter.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/product.dart';
import '../widgets/custom_button.dart';

class CatalogPage extends StatefulWidget {

  final String category;

  CatalogPage({required this.category});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {

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
                  child: StreamBuilder<List<String>>(
                      stream: ProductProvider.getAllCategoriesFromFirestore(),
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
                FilterWidget(),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<List<Product>>(
            stream: ProductProvider.getProductsFromCategory(widget.category),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot!.data;
                return Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 1.w,
                        mainAxisExtent: 260.h),
                    itemBuilder: (context, index) =>
                        ProductCard(product: data![index]),
                    itemCount: data!.length,
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
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


}
