import 'package:ecommerce/helper_function.dart ' as helper;
import 'package:ecommerce/themes.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_form_field.dart';
import 'package:ecommerce/widgets/sign_up_with_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  bool isLoading = false;

  Future<void> firebaseSignUp({required String email, required String password}) async {

    setState(() {
      isLoading = true;
    });
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      helper.showSnackBar(e.code, context);
    }
    setState(() {
      isLoading = false;
    });
  }


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
                  title: 'Sign Up',
                ),
                SizedBox(
                  height: 73.h,
                ),
                AuthPageTextField(
                  textEditingController: emailController,
                  validator: helper.validateEmail,
                  textFieldType: TextFieldType.textFieldEmail,
                ),
                SizedBox(
                  height: 8.h,
                ),
                AuthPageTextField(
                  textEditingController: nameController,
                  validator: helper.validateName,
                  textFieldType: TextFieldType.textFieldName,
                ),
                SizedBox(
                  height: 8.h,
                ),
                AuthPageTextField(
                  validator: helper.validatePassword,
                  textEditingController: passwordController,
                  textFieldType: TextFieldType.textFieldPassword,
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
                              builder: (context) => LoginPage()));
                        },
                        child: Text('Already have an account? ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 14.sp)),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.red.shade800,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                CustomButton(
                  buttonText: "SIGN UP",
                  isLoading: isLoading,
                  buttonWidth: 343.w,
                  buttonHeight: 48.h,
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      firebaseSignUp(email: emailController.text.trim(), password: passwordController.text.trim());
                    }
                  },
                ),
                SizedBox(
                  height: 80.h,
                ),
                Text(
                  'Or sign up with social account',
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
                      width: 16.w,
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
