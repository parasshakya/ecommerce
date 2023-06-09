import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/screens/productCardTestScreen.dart';
import 'package:ecommerce/screens/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return MainScreen();
          }
          else{
            return SignUpPage();
          }
        },
      ) ,
    );
  }
}
