import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/device_utility.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EcoHelperFunctions.isDarkMode(context);
    final controller = Get.put(OnBoardingController());
    return Positioned(
        right: EcoSizes.defaultSpace,
        bottom: EcoDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: controller.nextPage,
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? EcoColors.primary : EcoColors.black),
            child: const Icon(Iconsax.arrow_right_3)));
  }
}
