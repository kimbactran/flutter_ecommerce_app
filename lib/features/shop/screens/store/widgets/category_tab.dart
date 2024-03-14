import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/brand/brand_showcase.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoTabCategory extends StatelessWidget {
  const EcoTabCategory({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(EcoSizes.defaultSpace),
            child: Column(children: [
              /// -- Brands
              const EcoBrandShowcase(
                images: [
                  EcoImages.productImage1,
                  EcoImages.productImage2,
                  EcoImages.productImage3,
                ],
              ),
              const EcoBrandShowcase(
                images: [
                  EcoImages.productImage1,
                  EcoImages.productImage2,
                  EcoImages.productImage3,
                ],
              ),
              EcoSectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(height: EcoSizes.spaceBtwItems),
              EcoGridLayout(
                itemCount: 6,
                itemBuilder: (_, index) => const EcoProductCardVertical(),
              )

              /// -- Products
            ]),
          ),
        ]);
  }
}
