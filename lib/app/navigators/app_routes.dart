// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const logingScreen = _Paths.logingScreen;
  static const splashScreen = _Paths.splashScreen;
}

abstract class _Paths {
  static const splashScreen = '/splashScreen';
  static const logingScreen = '/logingScreen';
}
