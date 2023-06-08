import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:ecommerce/widgets/section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Product>> _productsOnSaleFuture = ProductProvider.getProductsOnSale();
  Future<List<Product>> _productsOnNewFuture = ProductProvider.getNewProducts();


  Future<void> _refreshData() async {
    setState(() {
      _productsOnNewFuture = ProductProvider.getNewProducts();
      _productsOnSaleFuture = ProductProvider.getProductsOnSale();
    });
  }



  Future<void> firebaseSignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
  }



  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.getAllProducts();
    return Scaffold(

      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(

              expandedHeight: 536.h,
              collapsedHeight: 230.h,
              backgroundColor: Colors.grey.shade200,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/bannerImage.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Fashion sale',
                          style: TextStyle(
                            fontSize: 48.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomButton(
                            buttonText: 'Check',
                            buttonHeight: 36.h,
                            buttonWidth: 160.w,
                            onPressed: (){})
                      ],
                    ),
                    titlePadding:
                        EdgeInsets.only(right: 171.w, bottom: 86.h, left: 15.w),
                    expandedTitleScale: 1.1,
                  ),
                ],
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 37.h,
              ),
            ),

            SliverToBoxAdapter(
              child: FutureBuilder<List<Product>>(
                  future: _productsOnSaleFuture,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      final data = snapshot.data;
                      final listOfProductCards = data!.map((e) => ProductCard(product: e,)).toList();
                      return Section(
                        title: "Sale",
                        subtitle: "Super summer sale",
                        children: listOfProductCards,
                      );
                    }else if (snapshot.hasError){
                      return  Center(child: Text('Error: ${snapshot.error}'),);
                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }

                  }
              )
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40.h,

              ),
            ),

            SliverToBoxAdapter(
              child: FutureBuilder<List<Product>>(
                  future: _productsOnNewFuture,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      final data = snapshot.data;
                      final listOfProductCards = data!.map((e) => ProductCard(product: e,)).toList();
                      return Section(
                        title: "New",
                        subtitle: "You've never seen it before",
                        children: listOfProductCards,
                      );
                    }else if (snapshot.hasError){
                      return  Center(child: Text('Error: ${snapshot.error}'),);
                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }

                  }
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40.h,

              ),
            ),
            SliverToBoxAdapter(
              child: Consumer<ProductProvider>(
                builder: (context, value, child) {

                  final listOfAllProductCards = value.listOfAllProducts.map((e) => ProductCard(product: e,)).toList();
                  return Section(
                    title: "All Products",
                    subtitle: "A list of all products",
                    children: listOfAllProductCards,
                  );
                },
              )
            ),
          ],
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children:  [
          //     Container(
          //       height: 536.h,
          //       width: 375.w,
          //       color: Colors.red.shade800,
          //     ),
          //     SizedBox(height: 8.h,),
          //     CustomButton(buttonText: 'Sign Out', buttonHeight: 64.h, buttonWidth: 343.w, onPressed: (){
          //
          //       firebaseSignOut();
          //
          //     })
          //   ],
          // ),
        ),
      ),
    );
  }



}
