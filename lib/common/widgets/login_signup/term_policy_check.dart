import 'package:ecommerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoTermsAndConditionCheckbox extends StatelessWidget {
  const EcoTermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignupController());

    final dark = EcoHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: signUpController.privacyPolicy.value,
                onChanged: (value) => signUpController.privacyPolicy.value =
                    !signUpController.privacyPolicy.value))),
        const SizedBox(
            // width: EcoSizes.spaceBtwItems,
            width: 6),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${EcoTexts.iAgreeTo}',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${EcoTexts.privacyPolicy}',
              style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: dark ? EcoColors.white : EcoColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? EcoColors.white : EcoColors.primary,
                  )),
          TextSpan(text: ' and ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${EcoTexts.termsOfUse}',
              style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: dark ? EcoColors.white : EcoColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? EcoColors.white : EcoColors.primary,
                  )),
        ]))
      ],
    );
  }
}
