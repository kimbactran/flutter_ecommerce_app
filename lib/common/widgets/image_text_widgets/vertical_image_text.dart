import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoVerticalImageText extends StatelessWidget {
  const EcoVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = EcoColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: EcoSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            EcoCircularImage(
              imageUrl: image,
              fit: BoxFit.fitWidth,
              padding: EdgeInsets.all(EcoSizes.sm * 1.4),
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: EcoHelperFunctions.isDarkMode(context)
                  ? EcoColors.light
                  : EcoColors.dark,
            ),

            /// Text
            const SizedBox(
              height: EcoSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
