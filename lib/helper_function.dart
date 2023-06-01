// Name validator
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String? validateName(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your name';
  }
  // Regular expression pattern to match alphabets only
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

  if (!nameRegExp.hasMatch(value)) {
    return 'Name should contain only alphabets';
  }

  return null;
}

// Email validator
String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return 'Please enter an email address';
  }
  // Regular expression pattern for email validation
  String pattern = r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

// Password validator
String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

void showSnackBar(String message, BuildContext context){
  ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar( backgroundColor: Colors.red.shade800,content: Center(child: Text(message))));

}

