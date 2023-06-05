import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductProvider extends ChangeNotifier {

  List<String> _categoryList = [];

  List<String> get getCategories => _categoryList;

  static Stream<List<Product>> getAllProducts() =>
      FirebaseFirestore.instance
          .collection('products')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  static Stream<List<Product>> getProductsOnSale() =>
      FirebaseFirestore.instance
          .collection('products')
          .where("section", isEqualTo: 'sale')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  static Stream<List<Product>> getNewProducts() =>
      FirebaseFirestore.instance
          .collection('products')
          .where("section", isEqualTo: 'new')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  static Stream<List<String>> getAllCategoriesFromFirestore() {
    return FirebaseFirestore.instance
        .collection('products')
        .where("category", isNull: false)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) =>
        doc.data()['category'] as String
        ).toSet().toList());
  }

  static Stream<List<Product>> getProductsFromCategory(String category) {
    return FirebaseFirestore.instance.collection('products').where(
        'category', isEqualTo: category).snapshots().map((snapshot) => snapshot.docs.map((doc) =>
    Product.fromJson(doc.data())).toList());
  }
}
