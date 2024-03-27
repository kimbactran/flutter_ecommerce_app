// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDO9A7EJsaOaaSuPKeS0rD3FSEP6AzCZEc',
    appId: '1:318467953710:web:618b2faad1d4ac9fa73bbf',
    messagingSenderId: '318467953710',
    projectId: 'ecommerceapp-dbf24',
    authDomain: 'ecommerceapp-dbf24.firebaseapp.com',
    storageBucket: 'ecommerceapp-dbf24.appspot.com',
    measurementId: 'G-3L4T5V78YJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDb3zfyF-Nv6LGf17wcZlFXMmXeua87CCg',
    appId: '1:318467953710:android:3d57cec2e196797ea73bbf',
    messagingSenderId: '318467953710',
    projectId: 'ecommerceapp-dbf24',
    storageBucket: 'ecommerceapp-dbf24.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWHUu2xK5nUQLecWzdz1Fi-pgqqTUEJ_U',
    appId: '1:318467953710:ios:eb35424622a5e0d5a73bbf',
    messagingSenderId: '318467953710',
    projectId: 'ecommerceapp-dbf24',
    storageBucket: 'ecommerceapp-dbf24.appspot.com',
    androidClientId: '318467953710-k2kkuv8pcraobsuqrh2p7pvqcq5g91if.apps.googleusercontent.com',
    iosClientId: '318467953710-k8o2fct9g1u6i8rqq2qq6us43re7lqul.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWHUu2xK5nUQLecWzdz1Fi-pgqqTUEJ_U',
    appId: '1:318467953710:ios:a817430c66f167e3a73bbf',
    messagingSenderId: '318467953710',
    projectId: 'ecommerceapp-dbf24',
    storageBucket: 'ecommerceapp-dbf24.appspot.com',
    androidClientId: '318467953710-k2kkuv8pcraobsuqrh2p7pvqcq5g91if.apps.googleusercontent.com',
    iosClientId: '318467953710-s8mj9tm5usqtd3ns4hjb3lmorgiff3to.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp.RunnerTests',
  );
}