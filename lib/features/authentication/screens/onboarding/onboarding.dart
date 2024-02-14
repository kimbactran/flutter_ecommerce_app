import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_dot.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_skip_button.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
        body: Stack(
      children: [
        /// Horizontal Scrollable Pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
                image: EcoImages.onBoardingImage1,
                title: EcoTexts.onBoardingTitle1,
                subTitle: EcoTexts.onBoardingSubtitle1),
            OnBoardingPage(
                image: EcoImages.onBoardingImage2,
                title: EcoTexts.onBoardingTitle2,
                subTitle: EcoTexts.onBoardingSubtitle2),
            OnBoardingPage(
                image: EcoImages.onBoardingImage3,
                title: EcoTexts.onBoardingTitle3,
                subTitle: EcoTexts.onBoardingSubtitle3),
          ],
        ),

        /// Skip Button
        const OnBoardingSkip(),

        /// Dot Navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),

        /// Circular Button
        const OnBoardingNextButton(),
      ],
    ));
  }
}
