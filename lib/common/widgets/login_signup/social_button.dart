import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoSocialButtons extends StatelessWidget {
  const EcoSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: EcoColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: EcoSizes.iconMd,
                  height: EcoSizes.iconMd,
                  image: AssetImage(EcoImages.google))),
        ),
        const SizedBox(
          width: EcoSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: EcoColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: EcoSizes.iconMd,
                  height: EcoSizes.iconMd,
                  image: AssetImage(EcoImages.facebook))),
        ),
      ],
    );
  }
}
