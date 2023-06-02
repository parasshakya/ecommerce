import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductProvider extends ChangeNotifier{



  List<ProductCard> _listOfProductCards = [];

  List<ProductCard> get listOfProductCards => _listOfProductCards;

   void  buildProductCards() {
    FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          final product = Product.fromJson(doc.data());
          _listOfProductCards.add(
            ProductCard(product: product)
          );
          notifyListeners();
        }));


  }




}


