import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () => Get.back(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EcoSizes.defaultSpace),
          child: Column(
            children: [
              /// Image with 69% of screen width
              Image(
                image: const AssetImage(EcoImages.deliveredEmailIllustration),
                width: EcoHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),

              /// Title & Subtitle
              Text(
                EcoTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwItems,
              ),
              Text(
                EcoTexts.changeYourPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),

              /// Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      child: const Text(EcoTexts.done))),
              const SizedBox(
                height: EcoSizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(EcoTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
