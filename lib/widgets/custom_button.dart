import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;

  CustomButton({required this.buttonText, required this.buttonHeight, required this.buttonWidth});
  @override
  Widget build(BuildContext context) {
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
