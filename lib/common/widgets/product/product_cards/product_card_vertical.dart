import 'package:ecommerce_app/common/styles/shadows.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/product/favourite_icon/favourite_icon.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_cart_add_cart_button.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoProductCardVertical extends StatelessWidget {
  const EcoProductCardVertical({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    /// Container with side paddings, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: product,
          )),
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
              height: 150,
              padding: const EdgeInsets.all(0),
              backgroundColor: darkMode ? EcoColors.dark : EcoColors.light,
              child: Stack(children: [
                /// -- Thumbnail Image
                EcoRoundedImage(
                  imageUrl: product.thumbnail,
                  applyImageRadius: true,
                  isNetworkImage: true,
                ),

                /// -- Sale Tag
                if (salePercentage != null)
                  Positioned(
                    top: 12,
                    left: 10,
                    child: EcoRoundedContainer(
                      radius: EcoSizes.sm,
                      backgroundColor: EcoColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: EcoSizes.sm, vertical: EcoSizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: EcoColors.black),
                      ),
                    ),
                  ),

                /// -- Favourite Icon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: EcoFavouriteIcon(
                    productId: product.id,
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems / 2,
            ),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: EcoSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EcoProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwItems / 2,
                  ),
                  EcoBrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
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
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: EcoSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      // Price, Show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(left: EcoSizes.sm),
                        child: EcoProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Add to Cart Button
                EcoProductCardAddToCartButton(product: product),
              ],
            )
          ],
        ),
      ),
    );
  }
}
