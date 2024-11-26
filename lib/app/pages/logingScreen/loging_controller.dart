import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/routes_management.dart';
import 'package:krishna_ornaments/domain/models/login_model.dart';
import 'package:krishna_ornaments/domain/repositories/repositories.dart';

class LoginController extends GetxController {
  LoginController(this.loginPresenter);

  final LoginPresenter loginPresenter;

  ///// =========== >>>>> Login Screen <<<<< =========== /////

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> logingFormkey = GlobalKey<FormState>();

  LoginModel? loginData;

  Future<void> loginApi({
    required String emailController,
    required String passwordController,
  }) async {
    var response = await loginPresenter.loginApi(
      mobile: emailController,
      password: passwordController,
      fcm: '',
      isLoading: true,
    );
    loginData = null;
    if (response?.data != null) {
      loginData = response;
      Get.find<Repository>()
          .saveValue(LocalKeys.authToken, response?.data?.accessToken);
      RouteManagement.goToBottomBarView();
      update();
    } else {
      Utility.errorMessage('Oops something went wrong');
    }
  }

  ///// =========== >>>>> Signup Screen <<<<< =========== /////

  GlobalKey<FormState> signUpFormkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController compleyNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isEditValid = false;
  var dailEditcode = '+91';

  Future<void> registerApi() async {
    var response = await loginPresenter.registerApi(
      city: cityController.text,
      countryCode: dailEditcode,
      mobile: mobileNumberController.text,
      password: confirmPasswordController.text,
      name: nameController.text,
      email: emailController.text,
      companyname: compleyNameController.text,
      isLoading: true,
    );
    if (response?.data != null) {
      update();
    } else {
      Utility.errorMessage(jsonDecode(response?.message ?? ""));
    }
  }

  ///// =========== >>>>> Signup Screen <<<<< =========== /////

  TextEditingController forgotEmailController = TextEditingController();
  GlobalKey<FormState> forgotPassFormkey = GlobalKey<FormState>();

  Future<void> forgotPass() async {
    var response = await loginPresenter.forgotPass(
      email: forgotEmailController.text,
      isLoading: true,
    );

    if (response?.data != null) {
      Get.snackbar('Forgot PassWord', response!.message.toString());
      update();
    } else {
      Utility.errorMessage('Oops something went wrong');
    }
  }
}
