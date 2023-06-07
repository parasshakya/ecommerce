import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/screens/catalog_page.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_button.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}


class _ShopPageState extends State<ShopPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Column(
          children: [
            SizedBox(height: 16.h,),
            CustomButton(
              onPressed: () {},
              buttonText: "VIEW ALL ITEMS",
              buttonWidth: 343.w,
              buttonHeight: 48.h,
            ),
            SizedBox(height: 16.h,),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 16.w),
                  child: Text('Choose Category',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),),
                )),
            SizedBox(height: 32.h,),
            Expanded(
              child: FutureBuilder<List<String>>(
                future: ProductProvider.getAllCategoriesFromProducts(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){

                    final data = snapshot!.data;

                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CatalogPage(category: data![index])));
                          },
                            contentPadding: EdgeInsets.only(left: 40.w),
                            title: Text(data![index]),
                        ),
                        separatorBuilder: (context, index) =>
                            Divider(height: 10,thickness: 1, )
                        , itemCount: data!.length);
                  }else if(snapshot.hasError){
                    return Center(child: Text('Something went wrong'),);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }
              )
            ),

          ],
        ),
      ),
    );
  }
}
