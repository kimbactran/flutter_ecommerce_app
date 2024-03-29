import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcoAppBar(
        title: Text("Sports Shirts",
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(EcoSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const EcoRoundedImage(
                imageUrl: EcoImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  EcoSectionHeading(
                    title: "Sport shirts",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: EcoSizes.defaultSpace,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return EcoProductCardHorizontal(
                            product: ProductModel.empty(),
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
