import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categoreis.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const EcoPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  EcoHomeAppBar(),
                  SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// -- SearchBar
                  EcoSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// -- Categories
                  EcoHomeCategories()
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(EcoSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const EcoPromoSlider(
                    banners: [
                      EcoImages.promoBanner1,
                      EcoImages.promoBanner2,
                      EcoImages.promoBanner3,
                      EcoImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// -- Heading
                  EcoSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwItems,
                  ),

                  /// -- Popular Products
                  EcoGridLayout(
                    itemCount: 5,
                    itemBuilder: (_, index) => const EcoProductCardVertical(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
