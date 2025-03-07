// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBJp4QLZGJAOLYuw6We9grijtCh0Aj-b7M',
    appId: '1:633045384708:web:94fe189425f160c1cdbf51',
    messagingSenderId: '633045384708',
    projectId: 'krishna-ornaments-4ecb9',
    authDomain: 'krishna-ornaments-4ecb9.firebaseapp.com',
    storageBucket: 'krishna-ornaments-4ecb9.firebasestorage.app',
    measurementId: 'G-V86LF52NV3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9l1Ul1fTqbPX74v72B2l-qbzbC_Bqe9A',
    appId: '1:633045384708:android:103e2f910a9397c3cdbf51',
    messagingSenderId: '633045384708',
    projectId: 'krishna-ornaments-4ecb9',
    storageBucket: 'krishna-ornaments-4ecb9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjVprj29SxXfjepQtLEcgB7Rwm0MlqwX8',
    appId: '1:633045384708:ios:292b3a1112d55ffecdbf51',
    messagingSenderId: '633045384708',
    projectId: 'krishna-ornaments-4ecb9',
    storageBucket: 'krishna-ornaments-4ecb9.firebasestorage.app',
    iosBundleId: 'com.example.krishnaOrnaments',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjVprj29SxXfjepQtLEcgB7Rwm0MlqwX8',
    appId: '1:633045384708:ios:292b3a1112d55ffecdbf51',
    messagingSenderId: '633045384708',
    projectId: 'krishna-ornaments-4ecb9',
    storageBucket: 'krishna-ornaments-4ecb9.firebasestorage.app',
    iosBundleId: 'com.example.krishnaOrnaments',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBJp4QLZGJAOLYuw6We9grijtCh0Aj-b7M',
    appId: '1:633045384708:web:c59f24c4b81376d8cdbf51',
    messagingSenderId: '633045384708',
    projectId: 'krishna-ornaments-4ecb9',
    authDomain: 'krishna-ornaments-4ecb9.firebaseapp.com',
    storageBucket: 'krishna-ornaments-4ecb9.firebasestorage.app',
    measurementId: 'G-1Y0W4H4M2W',
  );
}
