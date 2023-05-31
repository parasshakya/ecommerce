import 'package:ecommerce/themes.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_form_field.dart';
import 'package:ecommerce/widgets/sign_up_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AuthPageAppBar(
                title: ' Forgot password',
              ),
              SizedBox(height: 87.h,),
              Text('Please, enter your email address. You will receive a link to create a new password via email.', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp
              ),),
              SizedBox(height: 16.h,),
              AuthPageTextField( hintText: 'Email', labelText: "Email", isInputCorrect: false,),
              SizedBox(height: 63.h,),
              CustomButton(
                buttonText: "SEND",
                buttonWidth: 343.w,
                buttonHeight: 43.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
