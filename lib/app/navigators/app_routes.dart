// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const loginScreen = _Paths.loginScreen;
  static const splashScreen = _Paths.splashScreen;
  static const forgotScreen = _Paths.forgotScreen;
}

abstract class _Paths {
  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
  static const forgotScreen = '/forgotScreen';
}
