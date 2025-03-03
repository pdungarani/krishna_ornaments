import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/routes_management.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class LoginController extends GetxController {
  LoginController(this.loginPresenter);

  final LoginPresenter loginPresenter;

  var firebaseMessaging = FirebaseMessaging.instance;

  String? facmToken;

  int genderValue =0;

  @override
  onInit() async {
    super.onInit();
    await firebaseMessaging.getToken().then((token) async {
      facmToken = token;
      print("FCM:-$facmToken");
    });
  }

  ///// =========== >>>>> Login Screen <<<<< =========== /////

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> logingFormkey = GlobalKey<FormState>();

  LoginModel? loginData;

  bool isLoginLoading = false;

  Future<void> loginApi() async {
    try {
      var response = await http.post(
        Uri.parse("https://api.krishnaornaments.com/user/login"),
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
        },
        body: jsonEncode({
          "username": emailController.text,
          "password": passwordController.text,
          "fcm": facmToken ?? "",
        }),
      );

      var loginModel = LoginModel.fromJson(jsonDecode(response.body));

      loginData = null;
      if (response.statusCode == 200 && loginModel.data != null) {
        loginData = loginModel;

        Get.find<Repository>().saveValue(LocalKeys.authToken,
            loginModel.data is Data ? loginModel.data?.accessToken : "");
        RouteManagement.goToBottomBarView();
      } else {
        Utility.errorMessage(
            loginModel.message ?? 'Oops, something went wrong');
      }
    } catch (e) {
      isLoginLoading = false;
      Utility.errorMessage('An error occurred: ${e.toString()}');
    } finally {
      isLoginLoading = false;
      update();
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
  TextEditingController emailReController = TextEditingController();

  bool isEditValid = false;
  var dailEditcode = '+91';
  var client = http.Client();

  Future<void> registerApi() async {
    var response = await client.post(
      Uri.parse("https://api.krishnaornaments.com/user/register"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "name": nameController.text,
        "email": emailReController.text,
        "companyname": compleyNameController.text,
        "city": cityController.text,
        "countryCode": dailEditcode,
        "mobile":
            "${dailEditcode.split("+").last}${mobileNumberController.text}",
        "country_wise_contact": {
          "number": mobileNumberController.text.isEmpty
              ? ""
              : "0${mobileNumberController.text}",
          "internationalNumber":
              "${dailEditcode} ${mobileNumberController.text}",
          "nationalNumber": "0${mobileNumberController.text}",
          "e164Number": dailEditcode + mobileNumberController.text,
          "countryCode": PhoneNumber.getISO2CodeByPrefix(dailEditcode),
          "dialCode": dailEditcode,
        },
        "password": confirmPasswordController.text,
      }),
    );
    var registerModel = registerModelFromJson(response.body);

    if (registerModel.data != null) {
      Utility.closeLoader();
      Utility.snacBar(registerModel.message ?? '', ColorsValue.appColor);
      RouteManagement.goToLoginView();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(jsonDecode(registerModel.message ?? ""));
    }
    update();
  }

  // Future<void> registerApi() async {
  //   var response = await loginPresenter.registerApi(
  //     city: cityController.text,
  //     countryCode: dailEditcode,
  //     mobile: "${dailEditcode.split("+").last}${mobileNumberController.text}",
  //     password: confirmPasswordController.text,
  //     name: nameController.text,
  //     email: emailController.text,
  //     companyname: compleyNameController.text,
  //     isLoading: true,
  //   );
  //   if (response?.data != null) {
  //     Utility.snacBar(response?.message ?? '', Colors.black26);
  //     RouteManagement.goToLoginView();
  //   } else {
  //     Utility.errorMessage(jsonDecode(response?.message ?? ""));
  //   }
  //   update();
  // }

  ///// =========== >>>>> Signup Screen <<<<< =========== /////

  TextEditingController forgotEmailController = TextEditingController();
  GlobalKey<FormState> forgotPassFormkey = GlobalKey<FormState>();

  // Future<void> forgotPass() async {
  //   var response = await loginPresenter.forgotPass(
  //     email: forgotEmailController.text,
  //     isLoading: true,
  //   );

  //   if (response?.data != null) {
  //     Get.snackbar('Forgot PassWord', response!.message.toString(),
  //         backgroundColor: ColorsValue.appColor);
  //     update();
  //   } else {
  //     Utility.errorMessage('Oops something went wrong');
  //   }
  // }

  Future<void> forgotPass() async {
    var response = await client.post(
      Uri.parse("https://api.krishnaornaments.com/user/forgotpassword"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "email": forgotEmailController.text,
      }),
    );
    var forgotPassModel = forgotPassModelFromJson(response.body);
    if (forgotPassModel.data != null) {
      Get.snackbar('Forgot PassWord', forgotPassModel.message.toString(),
          backgroundColor: ColorsValue.appColor);
      Utility.closeLoader();
    } else {
      Utility.closeLoader();

      Utility.errorMessage('Oops something went wrong');
    }
    update();
  }
}
