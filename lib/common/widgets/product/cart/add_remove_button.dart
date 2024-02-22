import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoProductQuantityWithAddRemoveButton extends StatelessWidget {
  const EcoProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        EcoCircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          size: EcoSizes.md,
          color: darkMode ? EcoColors.white : EcoColors.black,
          backgroundColor: darkMode ? EcoColors.white : EcoColors.light,
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
          icon: Iconsax.add,
          height: 32,
          width: 32,
          size: EcoSizes.md,
          color: EcoColors.white,
          backgroundColor: EcoColors.primary,
        ),
      ],
    );
  }
}
