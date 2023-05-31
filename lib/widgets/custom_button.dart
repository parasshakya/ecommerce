import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;

  CustomButton({required this.buttonText});
  @override
  Widget build(BuildContext context) {
   final buttonWidth =  MediaQuery.of(context).size.width * 0.9;
   final buttonHeight = MediaQuery.of(context).size.height * 0.07;
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      child: Center(child: Text(buttonText, style: TextStyle(color: Colors.white),)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.red.shade800,


      ),


    );
  }
}
