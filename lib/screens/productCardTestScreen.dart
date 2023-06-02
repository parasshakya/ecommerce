import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';


class ProductCardTestScreen extends StatelessWidget {

  const ProductCardTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProductCard(
          product:Product(
              section: "new",
              reviews: ["nice"],
              rating: '4',
              price: '500',
              discount: '10',
              category: 'trousers',
              name: 'Cool',
              imageUrl: 'https://www.gingerandsmart.com/cdn/shop/products/Ginger_Smart_PreFall22Collection_TerrazzoBlouse_2_600x.jpg?v=1654221286',
              id: '3'

          )
        ),
      ),
    );
  }
}
