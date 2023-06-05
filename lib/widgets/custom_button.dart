import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;
  final Function onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final TextStyle? buttonTextStyle;
  final Color? backgroundColor;

  const CustomButton({super.key, this.backgroundColor,  this.buttonTextStyle,this.padding ,this.isLoading = false, required this.buttonText, required this.buttonHeight, required this.buttonWidth, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: padding ,
        width: buttonWidth,
        height: buttonHeight,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: backgroundColor ?? Colors.red.shade800,


        ),
        child: Center(child: isLoading ? const CircularProgressIndicator() : Center(child: Text(buttonText, style:  buttonTextStyle ??  TextStyle(fontSize: 14.sp, color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis,))),


      ),
    );
  }
}
