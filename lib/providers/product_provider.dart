import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductProvider  {

  List<Product> _listOfProductsFromCategory = [];




  static Future<List<Product>> getProductsOnSale() async {

      final querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where("section", isEqualTo: 'sale')
          .get();
      return querySnapshot.docs
          .map((doc) => Product.fromJson(doc.data()))
          .toList();

  }

  static Future<List<Product>> getNewProducts() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where("section", isEqualTo: 'new')
        .get();
    return querySnapshot.docs
        .map((doc) => Product.fromJson(doc.data()))
        .toList();
  }

  static Future<List<String>> getAllCategoriesFromProducts() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .get();

    List<String> categoryList = querySnapshot.docs
        .map((doc) => doc.get('category') as String)
        .toSet()
        .toList();

    return categoryList;
  }



  static Future<List<Product>> getProductsFromCategory(String category) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: category)
        .get();
    return querySnapshot.docs
        .map((doc) => Product.fromJson(doc.data()))
        .toList();
  }




}
