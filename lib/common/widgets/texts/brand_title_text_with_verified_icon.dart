import 'package:ecommerce_app/common/widgets/texts/brand_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoBrandTitleWithVerifiedIcon extends StatelessWidget {
  const EcoBrandTitleWithVerifiedIcon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = EcoColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: EcoBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          brandTextSize: brandTextSize,
        )),
        const SizedBox(
          width: EcoSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: EcoColors.primary,
          size: EcoSizes.iconXs,
        )
      ],
    );
  }
}
