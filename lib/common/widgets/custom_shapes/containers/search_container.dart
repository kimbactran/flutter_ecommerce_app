import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/device_utility.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoSearchContainer extends StatelessWidget {
  const EcoSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.padding =
        const EdgeInsets.symmetric(horizontal: EcoSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: EcoDeviceUtils.getScreenWidth(),
        padding: const EdgeInsets.all(EcoSizes.md),
        decoration: BoxDecoration(
            color: showBackground
                ? darkMode
                    ? EcoColors.dark
                    : EcoColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(EcoSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: EcoColors.grey) : null),
        child: Row(
          children: [
            Icon(
              icon,
              color: EcoColors.darkGrey,
            ),
            const SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
