import 'package:ecommerce_app/common/styles/shadows.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EcoProductCardHorizontal extends StatelessWidget {
  const EcoProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: ProductModel.empty(),
          )),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EcoShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(EcoSizes.productImageRadius),
          color: darkMode ? EcoColors.darkerGrey : EcoColors.lightContainer,
        ),
        child: Row(
          children: [
            /// Thumbnail, WishList Button, Discount Tag
            EcoRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(EcoSizes.sm),
              backgroundColor: darkMode ? EcoColors.dark : EcoColors.light,
              child: Stack(children: [
                /// -- Thumbnail Image
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: EcoRoundedImage(imageUrl: EcoImages.productImage1)),

                /// -- Sale Tag
                Positioned(
                  top: 12,
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

            /// -- Details
            SizedBox(
              width: 172,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: EcoSizes.sm, left: EcoSizes.sm),
                child: Column(
                  children: [
                    const Column(
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

                    const Spacer(),

                    /// Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Price
                        ///
                        const Flexible(
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
                                  topLeft:
                                      Radius.circular(EcoSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(
                                      EcoSizes.productImageRadius))),
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
            ),
            // Add Spacer() here to keep the height of each Box same in case 1 or 2 lines of Headings
          ],
        ),
      ),
    );
  }
}
