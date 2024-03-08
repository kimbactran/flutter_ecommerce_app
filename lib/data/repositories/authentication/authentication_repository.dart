import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /* Email & Password Sign In */
  // [EmailAuthentication] - Sign In
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EcoFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EcoFormatException();
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EcoFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EcoFormatException();
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  // [ReAuthenticate] - ReAuthenticate User

  // [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw EcoFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EcoFormatException();
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [EmailAuthentication] - Forgot Password

  /* Federated identity & social sign in */

  //  [GoogleAuthentication] - GOOGLE

  // [FacebookAuthentication] - FACEBOOK

  /* End */

  // [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw EcoFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EcoFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EcoFormatException();
    } on PlatformException catch (e) {
      throw EcoPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [Delete User] - Remove user Auth and Firestore Account.
}
