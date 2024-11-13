// coverage:ignore-file

import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class RouteManagement {
  static void goToLoginView() => Get.offAllNamed<void>(Routes.loginScreen);
  static void goToForgotView() => Get.toNamed<void>(Routes.forgotScreen);
  static void goToSignupView() => Get.toNamed<void>(Routes.signUpScreen);
}
