import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/modals/user_model.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/networks/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variable
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy =
      true.obs; // Observable for checked box in term and policy.
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for lastName input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for firstName input
  final phoneNumber =
      TextEditingController(); // Controller for phoneNumber input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  // Signup
  void signup() async {
    try {
      // Start Loading
      EcoFullScreenLoader.openLoadingDialog(
          'We are processing your information...', EcoImages.loaderAnimation);
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        return;
      }
      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }
      // Privacy Policy Check
      if (!privacyPolicy.value) {
        EcoLoader.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Term of Use');
        return;
      }

      // Register user in the Firebase Authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      // Show Success Message
      EcoLoader.successSnackBar(
          title: 'Congratulation',
          message: 'Your account has been created! Verify email to continue.');
      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      // Show some one Generic Error to the user
      EcoLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      EcoFullScreenLoader.stopLoading();
    }
  }
}
