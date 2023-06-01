import 'package:ecommerce/helper_function.dart';
import 'package:ecommerce/themes.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_form_field.dart';
import 'package:ecommerce/widgets/sign_up_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'forgot_password.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AuthPageAppBar(
                  title: ' Login',
                ),
                SizedBox(
                  height: 73.h,
                ),
                AuthPageTextField(
                 textFieldType: TextFieldType.textFieldEmail,
                  validator: validateEmail,
                ),
                SizedBox(
                  height: 8.h,
                ),
                AuthPageTextField(
                 textFieldType: TextFieldType.textFieldPassword,
                  validator: validatePassword,
                  obscureText: true,

                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage()));
                        },
                        child: Text('Forgot your password? ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 14.sp)),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.red.shade900,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomButton(
                  buttonText: "LOGIN",
                  buttonWidth: 343.w,
                  buttonHeight: 48.h,
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Successful'),));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Failed')));
                    }
                  },
                ),
                SizedBox(
                  height: 130.h,
                ),
                Text(
                  'Or log in with social account',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignUpWithSocialContainer(
                      imageUrl:
                          'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png',
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    SignUpWithSocialContainer(
                      imageUrl:
                          'https://www.freepnglogos.com/uploads/facebook-logo-icon/facebook-logo-icon-file-facebook-icon-svg-wikimedia-commons-4.png',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
