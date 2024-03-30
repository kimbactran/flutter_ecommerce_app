import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/product/favourite_icon/favourite_icon.dart';
import 'package:ecommerce_app/features/shop/controllers/product/images_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoProductImageSlider extends StatelessWidget {
  const EcoProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return EcoCurvedEdgeWidget(
      child: Container(
        color: darkMode ? EcoColors.darkerGrey : EcoColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(EcoSizes.productImageRadius),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: EcoColors.primary,
                        ),
                      ),
                    );
                  })),
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
                    itemBuilder: (_, index) => Obx(() {
                          final imageSelected =
                              controller.selectedProductImage.value ==
                                  images[index];
                          return EcoRoundedImage(
                              width: 80,
                              isNetworkImage: true,
                              onPressed: () => controller
                                  .selectedProductImage.value = images[index],
                              backgroundColor:
                                  darkMode ? EcoColors.dark : EcoColors.white,
                              border: Border.all(
                                  color: imageSelected
                                      ? EcoColors.primary
                                      : Colors.transparent),
                              padding: const EdgeInsets.all(EcoSizes.sm),
                              imageUrl: images[index]);
                        }),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: EcoSizes.spaceBtwItems,
                        ),
                    itemCount: images.length),
              ),
            ),
            EcoAppBar(
              showBackArrow: true,
              actions: [EcoFavouriteIcon(productId: product.id)],
            )
          ],
        ),
      ),
    );
  }
}
