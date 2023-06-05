import 'package:ecommerce/screens/bag_page.dart';
import 'package:ecommerce/screens/favorites_page.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/profile_page.dart';
import 'package:ecommerce/screens/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> screens = [
    const HomePage(),
    const ShopPage(),
    const BagPage(),
    const FavoritesPage(),
     ProfilePage()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.red.shade800,
          type: BottomNavigationBarType.fixed,
          iconSize: 30.sp,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,

          onTap: (selectedIndex){

            setState(() {
              currentIndex = selectedIndex;
            });

          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,), label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Bag"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile"),

          ],

        ),
      ),
    );
  }
}
