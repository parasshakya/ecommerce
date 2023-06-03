import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductProvider extends ChangeNotifier{



  static Stream<List<Product>> getProducts() =>
      FirebaseFirestore.instance
          .collection('products')
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => Product.fromJson(doc.data()))
          .toList());



}







