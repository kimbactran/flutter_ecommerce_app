import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoTermsAndConditionCheckbox extends StatelessWidget {
  const EcoTermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EcoHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
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
                    color: dark
                        ? const Color.fromARGB(255, 58, 49, 49)
                        : EcoColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? EcoColors.white : EcoColors.primary,
                  )),
        ]))
      ],
    );
  }
}
