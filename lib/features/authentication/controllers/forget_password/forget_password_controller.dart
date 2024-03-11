import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce_app/utils/networks/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email.
  sendPasswordResetEmail() async {
    try {
      // Start Loaders
      EcoFullScreenLoader.openLoadingDialog(
          'Processing your request...', EcoImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EcoFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        EcoFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      EcoFullScreenLoader.stopLoading();

      // Show Success Screen
      EcoLoader.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password');

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      EcoFullScreenLoader.stopLoading();
      EcoLoader.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loaders
      EcoFullScreenLoader.openLoadingDialog(
          'Processing your request...', EcoImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EcoFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      EcoFullScreenLoader.stopLoading();

      // Show Success Screen
      EcoLoader.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password');
    } catch (e) {
      EcoFullScreenLoader.stopLoading();
      EcoLoader.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }
}
