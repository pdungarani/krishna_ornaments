import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/routes_management.dart';
import 'package:krishna_ornaments/domain/models/login_model.dart';
import 'package:krishna_ornaments/domain/repositories/repositories.dart';

class LoginController extends GetxController {
  LoginController(this.loginPresenter);

  final LoginPresenter loginPresenter;

  var firebaseMessaging = FirebaseMessaging.instance;

  String? facmToken;

  @override
  onInit() async {
    super.onInit();
    await firebaseMessaging.getToken().then((token) async {
      facmToken = token;
    });
  }

  ///// =========== >>>>> Login Screen <<<<< =========== /////

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> logingFormkey = GlobalKey<FormState>();

  LoginModel? loginData;

  bool isLoginLoading = false;

  Future<void> loginApi() async {
    var response = await loginPresenter.loginApi(
      mobile: emailController.text,
      password: passwordController.text,
      fcm: facmToken ?? "",
      isLoading: false,
    );
    loginData = null;
    if (response?.data != null) {
      loginData = response;
      Get.find<Repository>()
          .saveValue(LocalKeys.authToken, response?.data?.accessToken);
      RouteManagement.goToBottomBarView();
      isLoginLoading = false;
    } else {
      isLoginLoading = false;
      Utility.errorMessage('Oops something went wrong');
    }
    update();
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
      Utility.snacBar(response?.message ?? '', Colors.black26);
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
