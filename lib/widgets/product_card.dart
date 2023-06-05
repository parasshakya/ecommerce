import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductCard extends StatelessWidget {

  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.sp),
      child: Container(
        height: 260.h,
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [





                  Positioned(
                    top: 0,
                    child: Container(
                      height: 184.h,
                      width: 148.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(product.imageUrl, fit: BoxFit.cover,)),
                    ),
                  ),



                  if(product.discount.isNotEmpty) Positioned(
                    top: 8.h, left: 9.w,
                    child: CustomButton(buttonTextStyle: TextStyle(
                      fontSize: 11.sp, color: Colors.white
                    ),buttonText:  '-${double.parse(product.discount) / double.parse(product.price) * 100 }%', buttonHeight: 24.h , buttonWidth: 40.w, onPressed: (){

                    }),
                  ),

                  Positioned(
                    top: 164.h,
                    bottom: 1.h,
                    left: 113.w,
                    child: Container(
                      height: 36.h,
                      width: 36.w,
                      child:  CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding:  EdgeInsets.all(6.0.sp),
                          child: Icon(Icons.favorite_border_outlined, size: 24.sp, color: Colors.grey,),
                        ),
                      ),
                    ),
                  ),


                ],

              ),
            ),
            Wrap(
              children: [
                  RatingBar(
                    itemSize: 14.sp,
                      maxRating: 5,
                      minRating: 0,
                      itemCount: 5,

                      initialRating: double.parse(product.rating),

                      ratingWidget: RatingWidget(
                    half: Icon(Icons.star_half),
                    empty: Icon(Icons.star_border_outlined, color: Colors.grey,),
                    full: Icon(Icons.star, color: Colors.yellow.shade800,)
                  ), onRatingUpdate: _saveRating),
                Text(' (${product.reviews.length})', style: TextStyle(
                  fontSize: 10.sp,
                    color: Colors.grey
                ),),

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(product.name, style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey
                ),),
                Text(product.category, style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold
                ),),
                if(product.discount.isNotEmpty) RichText(

                  text: TextSpan(
                  children: [
                    TextSpan(text: '${product.price}\$', style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 14.sp, color: Colors.grey,
                    )),
                    TextSpan(text: '${int.parse(product.price) - int.parse(product.discount)}\$', style: TextStyle(fontSize: 14.sp, color: Colors.red.shade800)),
                  ]
                ), ),
                if(product.discount.isEmpty) Text('${product.price}\$', style: TextStyle(
                  fontSize: 14.sp,

                ),)
              ],
            )
          ],
        ),
      ),
    );
  }


  void _saveRating(double rating){

  }
}
