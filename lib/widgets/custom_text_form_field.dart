import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPageTextField extends StatelessWidget {

  final String hintText;
  final String labelText;
  final bool isInputCorrect;


  AuthPageTextField({ required this.hintText, required this.labelText, required this.isInputCorrect});


  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return 'Please enter name';
          }
          return null;
        },

        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: isInputCorrect ? Icon(Icons.check, color: Colors.green.shade400, size: 30.sp,) : Text(''),
          ),


          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          labelText: labelText,
          contentPadding: EdgeInsets.all(20.sp),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),

      ),
    );
  }
}
