import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPageTextField extends StatefulWidget {
  final TextFieldType? textFieldType;

  final FormFieldValidator<String>? validator;

  AuthPageTextField({this.textFieldType,
    this.validator,
    this.textEditingController,
    this.obscureText = false});

  final TextEditingController? textEditingController;
  final bool obscureText;

  @override
  State<AuthPageTextField> createState() => _AuthPageTextFieldState();
}

class _AuthPageTextFieldState extends State<AuthPageTextField> {

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      width: 343.w,
      child: TextFormField(
        onChanged: (value) {
          // if(widget.textFieldType == TextFieldType.textFieldEmail){
          //   setState(() {
          //     isValid = emailCheck(value);
          //   });
          // }
          // if(widget.textFieldType == TextFieldType.textFieldPassword){
          //   isValid = passwordCheck(value);
          //
          // }
          // if(widget.textFieldType == TextFieldType.textFieldName){
          //   isValid = nameCheck(value);
          //
          // }
          setState(() {
            isValid =
            widget.textFieldType == TextFieldType.textFieldEmail ? emailCheck(
                value) : widget.textFieldType == TextFieldType.textFieldName
                ? nameCheck(value)
                : widget.textFieldType == TextFieldType.textFieldPassword ? passwordCheck(value) : false;
          });
        },

        validator: widget.validator,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          errorBorder: isValid ? const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ) : const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: isValid ? const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ) : const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: 15.w, horizontal: 20.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.textFieldType == TextFieldType.textFieldEmail
              ? 'Email'
              : widget.textFieldType == TextFieldType.textFieldName
              ? 'Name'
              : widget.textFieldType == TextFieldType.textFieldPassword
              ? "Password"
              : '',
          labelText: widget.textFieldType == TextFieldType.textFieldEmail
              ? 'Email'
              : widget.textFieldType == TextFieldType.textFieldName
              ? 'Name'
              : widget.textFieldType == TextFieldType.textFieldPassword
              ? "Password"
              : '',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          alignLabelWithHint: true,

          labelStyle: TextStyle(color: Theme
              .of(context)
              .hintColor),
          suffixIcon: isValid
              ? const Icon(Icons.check, color: Colors.green)
              : null,


        ),
        obscureText: widget.obscureText,
      ),
    );
  }

  // Name checker
  bool nameCheck(String? value) {
    if (value!.isEmpty) {
      return false;
    }
    // Regular expression pattern to match alphabets only
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

    if (!nameRegExp.hasMatch(value)) {
      return false;
    }

    return true;
  }

// Email checker
  bool emailCheck(String? value) {
    if (value!.isEmpty) {
      return false;
    }

    // Regular expression pattern for email validation
    String pattern = r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

// Password checker
  bool passwordCheck(String? value) {
    if (value!.isEmpty) {
      return false;
    }
    if (value.length < 6) {
      return false;
    }
    return true;
  }

}

enum TextFieldType { textFieldName, textFieldEmail, textFieldPassword }
