import 'package:ecommerce/themes.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_form_field.dart';
import 'package:ecommerce/widgets/sign_up_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatelessWidget {

  final _formKeyforSignUp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AuthPageAppBar(
                title: 'Sign Up',
              ),
              SizedBox(height: 30.h,),
              AuthPageTextField(hintText: 'Name', labelText: "Name", isInputCorrect: true,),
              SizedBox(height: 10.h,),
              AuthPageTextField( hintText: 'Email', labelText: "Email", isInputCorrect: false,),
              SizedBox(height: 10.h,),
              AuthPageTextField( hintText: 'Password', labelText: "Password", isInputCorrect: false,),
              SizedBox(height: 20.h),
              Align(alignment: Alignment.centerRight, child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text('Already have an account? ', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16
                  )),
                  Icon(Icons.arrow_right_alt, color: Colors.red.shade900,)
                ],
              ),),
              SizedBox(height: 30.h,),
              CustomButton(
                buttonText: "SIGN UP",
              ),
              SizedBox(height: 50.h,),
              Text('Or sign up with social account', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp
              ),),
              SizedBox(height: 14.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  SignUpWithSocialContainer(
                    imageUrl: 'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png',
                  ),SizedBox(width: 10,),
                  SignUpWithSocialContainer(
                    imageUrl: 'https://www.freepnglogos.com/uploads/facebook-logo-icon/facebook-logo-icon-file-facebook-icon-svg-wikimedia-commons-4.png',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
