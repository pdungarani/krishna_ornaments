import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/custom_button.dart';
import 'package:krishna_ornaments/app/widgets/custom_international_textformfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, Dimens.zero),
            child: AppBar(
              backgroundColor: ColorsValue.primaryColor,
            ),
          ),
          // bottomNavigationBar: Padding(
          //   padding: const EdgeInsets.only(bottom: 10),
          //   child:
          // ),
          backgroundColor: ColorsValue.primaryColor,
          body: SafeArea(
            child: Form(
              key: controller.signUpFormkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                padding: Dimens.edgeInsets20,
                children: [
                  Text(
                    'sign_up'.tr,
                    style: Styles.primaryBold28,
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    text: 'name'.tr,
                    hintText: 'enter_your_name'.tr,
                    controller: controller.nameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_name'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'company_name'.tr,
                    hintText: 'enter_your_company_name'.tr,
                    controller: controller.compleyNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_your_company_name'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomInternationalPhoneFild(
                    textEditingController: controller.mobileNumberController,
                    text: 'mobile_number'.tr,
                    hintText: 'enter_mobile_number'.tr,
                    initialvalue: PhoneNumber(
                      isoCode: PhoneNumber.getISO2CodeByPrefix(
                        controller.dailEditcode,
                      ),
                    ),
                    onInputChanged: (PhoneNumber number) {
                      controller.dailEditcode = number.dialCode ?? '';
                    },
                    oninitialValidation: (bool value) {
                      controller.isEditValid = value;
                      controller.update();
                    },
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "enteryournumber".tr;
                      } else if (!controller.isEditValid) {
                        return "enter_valid_phone_number".tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'email'.tr,
                    hintText: 'enter_your_email'.tr,
                    controller: controller.emailReController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_your_email'.tr;
                      } else if (!Utility.emailValidator(value)) {
                        return 'please_enter_valid_email'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'city'.tr,
                    hintText: 'please_enter_city'.tr,
                    controller: controller.cityController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_city'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  Text(
                    "Gender",
                    style: Styles.color21212150014,
                  ),
                  Dimens.boxHeight5,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.0,
                            child: Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity(
                                horizontal: Dimens.zero,
                                vertical: Dimens.zero,
                              ),
                              value: 1,
                              groupValue: controller.genderValue,
                              onChanged: (val) {
                                controller.genderValue = val!;
                                controller.update();
                              },
                            ),
                          ),
                          Text(
                            'Male',
                            style: Styles.color21212150014,
                          ),
                        ],
                      ),
                      Dimens.boxWidth20,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.0,
                            child: Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity(
                                horizontal: Dimens.zero,
                                vertical: Dimens.zero,
                              ),
                              value: 2,
                              groupValue: controller.genderValue,
                              onChanged: (val) {
                                controller.genderValue = val!;
                                controller.update();
                              },
                            ),
                          ),
                          Text(
                            'Female',
                            style: Styles.color21212150014,
                          ),
                        ],
                      ),
                      Dimens.boxWidth20,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.0,
                            child: Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity(
                                horizontal: Dimens.zero,
                                vertical: Dimens.zero,
                              ),
                              value: 3,
                              groupValue: controller.genderValue,
                              onChanged: (val) {
                                controller.genderValue = val!;
                                controller.update();
                              },
                            ),
                          ),
                          Text(
                            'Other',
                            style: Styles.color21212150014,
                          ),
                        ],
                      )
                    ],
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'new_password'.tr,
                    hintText: 'enter_new_password'.tr,
                    controller: controller.newPasswordController,
                    textInputAction: TextInputAction.next,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_new_password'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'confirm_password'.tr,
                    hintText: 'enter_confirm_password'.tr,
                    controller: controller.confirmPasswordController,
                    textInputAction: TextInputAction.next,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_confirm_password'.tr;
                      } else if (!controller.newPasswordController.text
                          .contains(
                              controller.confirmPasswordController.text)) {
                        return 'pass_validation'.tr;
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
                        Utility.showLoader();
                        controller.registerApi();
                      }
                    },
                  ),
                  Dimens.boxHeight20,
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already Have An Account? ',
                          style: Styles.black50012,
                        ),
                        TextSpan(
                          text: 'Log In',
                          style: Styles.lightYellow40012,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offAll(const LoginScreen());
                            },
                        ),
                      ],
                    ),
                  ),
                  Dimens.boxHeight20,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
