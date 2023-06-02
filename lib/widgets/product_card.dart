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
    return Container(
      height: 260.h,
      width: 150.w,
      child: Column(
        children: [
          Stack(
            children: [
              
                if(product.discount.isNotEmpty) Positioned(
                  top: 8.h, left: 9.w,
                  child: CustomButton(buttonText: product.discount , buttonHeight: 28.h , buttonWidth: 40.w, onPressed: (){

                  }),
                ),

                Positioned(
                  left: 112.w,
                  top: 164.h,
                  child: Container(
                    height: 36.h,
                    width: 36.w,
                    child:  CircleAvatar(
                      child: Icon(Icons.favorite_border_outlined, size: 24.sp,),
                    ),
                  ),
                ),


                Positioned(
                  top: 0,
                  child: Container(
                    height: 184.h,
                    width: 148.w,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(product.imageUrl)),
                  ),
                ),

                
            ],
          ),
          Wrap(
            children: [
                RatingBar(
                    maxRating: 5,
                    minRating: 0,
                    itemCount: double.parse(product.rating).toInt(),
                    ratingWidget: RatingWidget(
                  half: Icon(Icons.star_half),
                  empty: Icon(Icons.star_border_outlined),
                  full: Icon(Icons.star)
                ), onRatingUpdate: _saveRating),
              Text(' (${product.reviews.length})')
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name),
              Text(product.category),
              Text(product.price)
            ],
          )
        ],
      ),
    );
  }

  void _saveRating(double rating){

  }
}
