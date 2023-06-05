import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final idController = TextEditingController();

  final categoryController = TextEditingController();

  final nameController = TextEditingController();

  final priceController = TextEditingController();

  final discountController = TextEditingController();

  final imageUrlController = TextEditingController();

  final ratingController = TextEditingController();

  final reviewsController = TextEditingController();

  final sectionController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(decoration: InputDecoration(hintText: 'id'),
                  controller: idController,),
                TextField(decoration: InputDecoration(hintText: 'category'),
                  controller: categoryController,
                ),
                TextField(decoration: InputDecoration(hintText: 'name'),
                  controller: nameController,
                ),
                TextField(decoration: InputDecoration(hintText: 'price'),

                  controller: priceController,),
                TextField(decoration: InputDecoration(hintText: 'discount'),
                  controller: discountController,
                ),
                TextField(decoration: InputDecoration(hintText: 'imageUrl'),
                  controller: imageUrlController,
                ),
                TextField(decoration: InputDecoration(hintText: 'rating'),
                  controller: ratingController,
                ),
                TextField(decoration: InputDecoration(hintText: 'reviews'),
                  controller: reviewsController,
                ),
                TextField(decoration: InputDecoration(hintText: 'section'),
                  controller: sectionController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                    buttonText: 'Add',
                    buttonHeight: 48.h,
                    buttonWidth: 343.w,
                    isLoading: _isLoading,
                    onPressed: () {
                      addProductToFirestore(
                          idController.text.trim(),
                          categoryController.text.trim(),
                          nameController.text.trim(),
                          priceController.text.trim(),
                          discountController.text.trim(),
                          imageUrlController.text.trim(),
                          ratingController.text.trim(),
                          reviewsController.text.split(','),
                          sectionController.text.trim());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addProductToFirestore(String id,
      String category,
      String name,
      String price,
      String discount,
      String imageUrl,
      String rating,
      List<String> reviews,
      String section) async {

    setState(() {
      _isLoading = true;
    });
   try{
     await FirebaseFirestore.instance.collection('products').add({
       'id': id,
       'category': category,
       'name': name,
       'price': price,
       'discount': discount,
       'imageUrl': imageUrl,
       'rating': rating,
       'reviews': reviews ,
       'section': section
     });
   }on FirebaseException catch(e){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
   }
   setState(() {
     _isLoading = false;
   });

    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(const SnackBar(content: Text('Product added successfully')));

  }
}
