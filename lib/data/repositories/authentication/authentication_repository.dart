import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();

  // Called from main.dart on app launch
  @override
  void onReady() {
    // Local Storage
    if (kDebugMode) {
      print('================= GET STORAGE ===========');
      print(deviceStorage.read('IsFirstTime'));
    }
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to Show Relevant Screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* Email & Password Sign In */
  // [EmailAuthentication] - Sign In

  // [EmailAuthentication] - Register

  // [ReAuthenticate] - ReAuthenticate User

  // [Email Verification] - Mail Verification

  // [EmailAuthentication] - Forgot Password

  /* Federated identity & social sign in */

  //  [GoogleAuthentication] - GOOGLE

  // [FacebookAuthentication] - FACEBOOK

  /* End */

  // [LogoutUser] - Valid for any authentication.

  // [Delete User] - Remove user Auth and Firestore Account.
}
