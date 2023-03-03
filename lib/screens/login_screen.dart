import 'package:flutter/material.dart';
import 'package:pathverse_app/helper/app_colors.dart';
import 'package:pathverse_app/helper/helper.dart';
import 'package:pathverse_app/screens/home_screen.dart';
import 'package:pathverse_app/widgets/custom_button.dart';
import 'package:pathverse_app/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/LoginScreen';

  LoginScreen({super.key});
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: shadowColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: secondaryColor,
                blurRadius: 4,
                offset: Offset(4, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 2,
          height: 305,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'email',
                  onChanged: (emailNewValue) {
                    email = emailNewValue;
                  },
                  validator: emailValidation,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Password',
                  onChanged: (passwordNewValue) {
                    password = passwordNewValue;
                  },
                  validator: passwordValidation,
                ),
                const SizedBox(height: 15),
                CustomButton(
                  primaryColor: primaryColor,
                  buttonText: 'Login',
                  elevation: 2,
                  textColor: textColorWhite,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Get.offAndToNamed(HomeScreen.route);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
