import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoBrandShowcase extends StatelessWidget {
  const EcoBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: EcoRoundedContainer(
        padding: const EdgeInsets.all(EcoSizes.sm),
        showBorder: true,
        borderColor: EcoColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(
          bottom: EcoSizes.spaceBtwItems,
        ),
        child: Column(
          /// Brand with Products Count
          children: [
            EcoBrandCard(
              showBorder: false,
              brand: brand,
            ),

            /// Brand top 3 product images
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);

    return Expanded(
      child: EcoRoundedContainer(
        height: 100,
        backgroundColor: darkMode ? EcoColors.darkGrey : EcoColors.light,
        margin: const EdgeInsets.only(right: EcoSizes.sm),
        child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) =>
                const EcoShimmerEffect(width: 100, height: 200),
            errorWidget: (context, url, error) => const Icon(Icons.error)),
      ),
    );
  }
}
