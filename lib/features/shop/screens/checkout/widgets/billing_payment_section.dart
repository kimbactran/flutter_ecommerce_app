import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';

class EcoBillingPaymentSection extends StatelessWidget {
  const EcoBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        EcoSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            EcoRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: darkMode ? EcoColors.light : EcoColors.white,
              padding: const EdgeInsets.all(EcoSizes.sm),
              child: const Image(
                image: AssetImage(EcoImages.google),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems / 2,
            ),
            Text(
              'Google',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
