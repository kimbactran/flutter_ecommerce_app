import 'package:ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.clear),
              onPressed: () => AuthenticationRepository.instance.logout(),
            )
          ],
        ),
        body: SingleChildScrollView(
          // Padding to Give Default Equal Space on all sides in all screens.
          child: Padding(
            padding: const EdgeInsets.all(EcoSizes.defaultSpace),
            child: Column(
              children: [
                /// Image
                Image(
                  image: const AssetImage(EcoImages.deliveredEmailIllustration),
                  width: EcoHelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(
                  height: EcoSizes.spaceBtwSections,
                ),

                /// Title & Subtitle
                Text(
                  EcoTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: EcoSizes.spaceBtwItems,
                ),
                Text(
                  email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: EcoSizes.spaceBtwItems,
                ),
                Text(
                  EcoTexts.confirmEmailSubtitle,
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
                        onPressed: () =>
                            controller.checkEmailVerificationStatus(),
                        child: const Text(EcoTexts.continueText))),
                const SizedBox(
                  height: EcoSizes.spaceBtwItems,
                ),
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => controller.sendEmailVerification(),
                        child: const Text(EcoTexts.resendEmail))),
              ],
            ),
          ),
        ));
  }
}
