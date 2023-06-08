import 'package:ecommerce/providers/brand_provider.dart';
import 'package:ecommerce/providers/category_provider.dart';
import 'package:ecommerce/providers/price_range_provider.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/screens/auth_page.dart';
import 'package:ecommerce/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductProvider(),),
    ChangeNotifierProvider(create: (context) => CategoryProvider(),),
    ChangeNotifierProvider(create: (context) => BrandProvider(),),
    ChangeNotifierProvider(create: (context) => PriceRangeProvider(),),
  ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) =>  MaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        textTheme: EcommerceThemes.ecomTheme,

      ),
      home:  const AuthPage(),
    ),
    );
  }
}
