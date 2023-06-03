import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductProvider  {
  static Stream<List<Product>> getAllProducts() => FirebaseFirestore.instance
      .collection('products')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  static Stream<List<Product>> getProductsOnSale() => FirebaseFirestore.instance
      .collection('products')
      .where("section", isEqualTo: 'sale')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  static Stream<List<Product>> getNewProducts() => FirebaseFirestore.instance
      .collection('products')
      .where("section", isEqualTo: 'new')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
}
