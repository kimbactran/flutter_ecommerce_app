import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoProductMetaData extends StatelessWidget {
  const EcoProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
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
                '$salePercentage%',
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
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              EcoProductPriceText(
                price: '\$${product.price}',
                lineThrough: true,
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(
                width: EcoSizes.spaceBtwItems,
              ),
            EcoProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 1.5,
        ),

        /// Title
        EcoProductTitleText(
          title: product.title,
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
              controller.getProductStockStatus(product.stock),
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
              isNetworkImage: true,
              imageUrl: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: darkMode ? EcoColors.white : EcoColors.black,
            ),
            if (product.brand!.isFeatured!)
              EcoBrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium,
              ),
            if (!product.brand!.isFeatured!)
              EcoBrandTitleText(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium,
              )
          ],
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwInputFields,
        )
      ],
    );
  }
}
