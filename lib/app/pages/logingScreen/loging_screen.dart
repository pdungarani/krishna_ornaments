import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/app/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.logingFormkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.width,
                    height: context.height * 0.4,
                    child: SvgPicture.asset(
                      AssetConstants.loginMainView,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: Dimens.edgeInsets20_0_20_0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.sign_in,
                          style: Styles.primaryBold28,
                        ),
                        Dimens.boxHeight30,
                        CustomTextFormField(
                          text: 'Username',
                          hintText: "Enter Your Username",
                          fillColor: ColorsValue.colorEEEAEA,
                          controller: controller.emailController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                        ),
                        Dimens.boxHeight20,
                        CustomTextFormField(
                          text: 'Password',
                          hintText: "Enter Your Password",
                          fillColor: ColorsValue.colorEEEAEA,
                          controller: controller.passwordController,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Please enter valid password";
                            }
                            return null;
                          },
                        ),
                        Dimens.boxHeight20,
                        CustomButton(
                            height: Dimens.fourtyFive,
                            text: 'LOG IN',
                            onTap: () {
                              if (controller.logingFormkey.currentState!
                                  .validate())
                                controller.loginApi(
                                  emailController:
                                      controller.emailController.text,
                                  passwordController:
                                      controller.passwordController.text,
                                );
                            }),
                        Dimens.boxHeight10,
                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Forgot your log in details?  ',
                                  style: Styles.black50012,
                                ),
                                TextSpan(
                                  text: 'Get help logging in. ',
                                  style: Styles.lightYellow40012,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      RouteManagement.goToForgotView();
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Dimens.boxHeight40,
                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: Styles.black50012,
                                ),
                                TextSpan(
                                  text: 'Sign up',
                                  style: Styles.lightYellow40012,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      RouteManagement.goToSignupView();
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Dimens.boxHeight5,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
