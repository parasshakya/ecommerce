import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class CatalogPage extends StatefulWidget {

  final String category;

  CatalogPage({required this.category});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: StreamBuilder<List<Product>>(
          stream: ProductProvider.getProductsFromCategory(widget.category),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final data = snapshot!.data;
              return ListView.builder(
                itemBuilder: (context, index) => ProductCard(product: data[index]) ,
                itemCount: data!.length,
              );
            }else if(snapshot.hasError){
              return const Center(child: Text('Something went wrong'),);
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
            }
        ),
      ),
    );
  }
}
