import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoProductImageSlider extends StatelessWidget {
  const EcoProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return EcoCurvedEdgeWidget(
      child: Container(
        color: darkMode ? EcoColors.darkerGrey : EcoColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(EcoSizes.productImageRadius),
                  child: Center(
                      child: Image(image: AssetImage(EcoImages.productImage1))),
                )),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => EcoRoundedImage(
                        width: 80,
                        backgroundColor:
                            darkMode ? EcoColors.dark : EcoColors.white,
                        border: Border.all(color: EcoColors.primary),
                        padding: const EdgeInsets.all(EcoSizes.sm),
                        imageUrl: EcoImages.productImage10),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: EcoSizes.spaceBtwItems,
                        ),
                    itemCount: 4),
              ),
            ),
            const EcoAppBar(
              showBackArrow: true,
              actions: [
                EcoCircularIcon(
                  icon: Iconsax.heart5,
                  size: 18,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
