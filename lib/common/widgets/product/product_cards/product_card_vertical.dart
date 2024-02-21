import 'package:ecommerce_app/common/styles/shadows.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/personalization/screens/screens/product_details/product_detail.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EcoProductCardVertical extends StatelessWidget {
  const EcoProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EcoShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(EcoSizes.productImageRadius),
          color: darkMode ? EcoColors.darkerGrey : EcoColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, WishList Button, Discount Tag
            EcoRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(EcoSizes.sm),
              backgroundColor: darkMode ? EcoColors.dark : EcoColors.light,
              child: Stack(children: [
                /// -- Thumbnail Image
                const EcoRoundedImage(imageUrl: EcoImages.productImage1),

                /// -- Sale Tag
                Positioned(
                  top: 12,
                  left: 10,
                  child: EcoRoundedContainer(
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
                ),

                /// -- Favourite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: EcoCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems / 2,
            ),

            /// -- Details
            const Padding(
              padding: EdgeInsets.only(left: EcoSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EcoProductTitleText(
                    title: "Acer aspire 7 A715-76-5",
                    smallSize: true,
                  ),
                  SizedBox(
                    height: EcoSizes.spaceBtwItems / 2,
                  ),
                  EcoBrandTitleWithVerifiedIcon(
                    title: "Acer",
                  ),
                ],
              ),
            ),
            // Add Spacer() here to keep the height of each Box same in case 1 or 2 lines of Headings
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                ///
                const Padding(
                  padding: EdgeInsets.only(left: EcoSizes.sm),
                  child: EcoProductPriceText(
                    price: '80.5',
                    isLarge: false,
                  ),
                ),

                /// Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                      color: EcoColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(EcoSizes.cardRadiusMd),
                          bottomRight:
                              Radius.circular(EcoSizes.productImageRadius))),
                  child: const SizedBox(
                      width: EcoSizes.iconLg * 1.2,
                      height: EcoSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(
                        Iconsax.add,
                        color: EcoColors.white,
                      ))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
