import 'package:ecommerce_app/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoBrandShowcase extends StatelessWidget {
  const EcoBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return EcoRoundedContainer(
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
            brand: BrandModel.empty(),
          ),

          /// Brand top 3 product images
          Row(
            children: images
                .map((image) => brandTopProductImageWiget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWiget(String image, context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);

    return Expanded(
      child: EcoRoundedContainer(
        height: 100,
        backgroundColor: darkMode ? EcoColors.darkGrey : EcoColors.light,
        margin: const EdgeInsets.only(right: EcoSizes.sm),
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
