import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoCartItem extends StatelessWidget {
  const EcoCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // Image
        EcoRoundedImage(
          imageUrl: EcoImages.productImage10,
          width: 60,
          height: 60,
          // padding: EdgeInsets.all(EcoSizes.sm),
          backgroundColor: darkMode ? EcoColors.darkGrey : EcoColors.light,
        ),
        const SizedBox(
          width: EcoSizes.spaceBtwItems,
        ),
        // Title, Price & Size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Flexible(child: EcoBrandTitleWithVerifiedIcon(title: 'Nike')),
            const EcoProductTitleText(
              title: "Black Sport Shoes",
              maxLines: 1,
            ),
            // Attributes
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '37 ', style: Theme.of(context).textTheme.bodyLarge),
            ]))
          ],
        )
      ],
    );
  }
}
