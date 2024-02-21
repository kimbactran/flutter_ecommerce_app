import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoBottomAddToCart extends StatelessWidget {
  const EcoBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: EcoSizes.defaultSpace,
          vertical: EcoSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: darkMode ? EcoColors.darkerGrey : EcoColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(EcoSizes.cardRadiusLg),
            topRight: Radius.circular(EcoSizes.cardRadiusLg),
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            const EcoCircularIcon(
              icon: Iconsax.minus,
              backgroundColor: EcoColors.darkGrey,
              width: 40,
              height: 40,
              color: EcoColors.white,
            ),
            const SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            Text(
              '2',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            const EcoCircularIcon(
              icon: Iconsax.minus,
              backgroundColor: EcoColors.black,
              width: 40,
              height: 40,
              color: EcoColors.white,
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(EcoSizes.md),
                backgroundColor: darkMode ? EcoColors.white : EcoColors.black,
                side: const BorderSide(color: EcoColors.black)),
            child: const Text('Add to Cart'))
      ]),
    );
  }
}
