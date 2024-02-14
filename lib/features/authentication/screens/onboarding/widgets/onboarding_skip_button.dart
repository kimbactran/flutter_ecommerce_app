import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Positioned(
        top: EcoDeviceUtils.getAppBarHeight(),
        right: EcoSizes.defaultSpace,
        child: TextButton(
          child: const Text('Skip'),
          onPressed: controller.skipPage,
        ));
  }
}
