import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/features/shop/controllers/home_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoPromoSlider extends StatelessWidget {
  const EcoPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            items: banners
                .map((urlImage) => EcoRoundedImage(imageUrl: urlImage))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 0.9,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index))),
        SizedBox(
          height: EcoSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  EcoCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? EcoColors.primary
                        : EcoColors.grey,
                    margin: EdgeInsets.only(right: 10),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
