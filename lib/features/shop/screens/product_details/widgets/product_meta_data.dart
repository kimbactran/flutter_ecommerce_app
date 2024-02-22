import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoProductMetaData extends StatelessWidget {
  const EcoProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            // Sale Tag

            EcoRoundedContainer(
              radius: EcoSizes.sm,
              backgroundColor: EcoColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: EcoSizes.sm, vertical: EcoSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: EcoColors.black),
              ),
            ),
            const SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),

            /// Price
            const EcoProductPriceText(
              price: '36',
              lineThrough: true,
            ),
            const SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            const EcoProductPriceText(
              price: '30',
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 1.5,
        ),

        /// Title
        const EcoProductTitleText(
          title: 'Acer Aspire 7 A715-76-57CY',
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 1.5,
        ),

        /// Stock Status
        Row(
          children: [
            const EcoProductTitleText(
              title: 'Status',
            ),
            const SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium!,
            ),
          ],
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            EcoCircularImage(
              imageUrl: EcoImages.cosmeticIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? EcoColors.white : EcoColors.black,
            ),
            const EcoBrandTitleWithVerifiedIcon(
              title: 'Acer',
              brandTextSize: TextSizes.medium,
            )
          ],
        )
      ],
    );
  }
}
