import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Forgot your log in details? ',
                  style: Styles.black50012,
                ),
                TextSpan(
                  text: 'Get help logging in. ',
                  style: Styles.lightYellow40012,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.offAll(const LoginScreen());
                    },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: ColorsValue.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.signUpFormkey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: Styles.primaryBold28,
                    ),
                    Dimens.boxHeight30,
                    CustomTextFormField(
                      text: 'Name',
                      hintText: 'Enter Your Name',
                      controller: controller.nameController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter right name';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight14,
                    CustomTextFormField(
                      text: 'Company Name',
                      hintText: 'Enter Your Company Name',
                      controller: controller.compleyNameController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter company name';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight14,
                    CustomTextFormField(
                      text: 'Mobile Number',
                      hintText: 'Enter mobile number',
                      controller: controller.mobileNumberController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter mobile number';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight14,
                    CustomTextFormField(
                      text: 'Email',
                      hintText: 'Enter Your Email',
                      controller: controller.emailController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter right email';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight14,
                    CustomTextFormField(
                      text: 'City',
                      hintText: 'Enter your city Name (optional)',
                      controller: controller.cityController,
                    ),
                    Dimens.boxHeight14,
                    CustomTextFormField(
                      text: 'New Password',
                      hintText: 'Enter Your New Password',
                      controller: controller.newPasswordController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter new password';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight14,
                    CustomTextFormField(
                      text: 'Conform Password ',
                      hintText: 'Enter Your Conform Password',
                      controller: controller.confirmPasswordController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter confirm password';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    CustomButton(
                      height: Dimens.fourtyFive,
                      text: 'Sign Up',
                      onTap: () {
                        if (controller.signUpFormkey.currentState!.validate()) {
                          log('signUp');
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
