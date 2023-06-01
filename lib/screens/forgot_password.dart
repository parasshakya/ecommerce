import 'package:ecommerce/helper_function.dart' as helper;
import 'package:ecommerce/themes.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_text_form_field.dart';
import 'package:ecommerce/widgets/sign_up_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordPage extends StatelessWidget {

  final forgotPasswordFieldController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AuthPageAppBar(
                  title: ' Forgot password',
                ),
                SizedBox(height: 87.h,),
                Text('Please, enter your email address. You will receive a link to create a new password via email.', style: TextStyle(
                  fontSize: 16.sp
                ), textAlign: TextAlign.justify),
                SizedBox(height: 16.h,),
                AuthPageTextField( textFieldType: TextFieldType.textFieldEmail,
                validator: validateEmail,
                  textEditingController: forgotPasswordFieldController,

                ),
                SizedBox(height: 63.h,),
                CustomButton(
                  buttonText: "SEND",
                  buttonWidth: 343.w,
                  buttonHeight: 43.h,
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      helper.showSnackBar('Reset link sent to ${forgotPasswordFieldController.text.trim()} ', context);
                    }else{
                      helper.showSnackBar('Reset link failed to send ', context);

                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
      return 'Not a valid email address. Should be your@email.com';
    }
    return null;
  }

}
