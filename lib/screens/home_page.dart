import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:ecommerce/widgets/section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            expandedHeight: 536.h,
            collapsedHeight: 196.h,
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
            child: Section(
              title: "Sale",
              subtitle: "Hurry up and buy",
              children: listOfProductCards,
            ),
          )
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
    );
  }

  List<ProductCard> listOfProductCards = [

  ];

  Widget buildImages() {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10.h, crossAxisSpacing: 5.w),
      itemBuilder: (context, index) => Container(
        color: Colors.red.shade800,
        width: 34.w,
        height: 34.h,
      ),
      itemCount: 20,
    );
  }
}
