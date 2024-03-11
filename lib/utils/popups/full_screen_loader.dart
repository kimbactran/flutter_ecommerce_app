import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// A utility class for managing a full-screen loading dialog
class EcoFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation
  /// This method doesn't return anything
  ///
  /// Parmaters:
  ///  - text: The text to be displayed in the loading dialog
  ///  - animation: The Lottie animation to be shown.

  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
                color: EcoHelperFunctions.isDarkMode(Get.context!)
                    ? EcoColors.dark
                    : EcoColors.white,
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 250,
                      ),
                      EcoAnimationLoaderWidget(text: text, animation: animation)
                    ],
                  ),
                ))));
  }

  /// Stop the currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();

    /// Close the dialog using navigator
  }
}
